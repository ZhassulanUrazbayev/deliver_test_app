import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/widgets/collapsing_app_bar.dart';
import 'package:deliver_test_app/widgets/food_description.dart';
import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

class FoodPage extends StatefulWidget {
  final Food food;

  FoodPage({this.food});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                brightness: Brightness.dark,
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Container(
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
                leading: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      widget.food.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Tab 1"),
                        Tab(text: "Tab 2"),
                        Tab(text: "Tab 3"),
                      ],
                    ),
                    widget.food),
                pinned: false,
              ),
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FoodInfo(widget.food),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                child: Text(
                  widget.food.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  textColor: Colors.black,
                  elevation: 0.0,
                  child: Text(
                    Constants.buy,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  color: Color.fromRGBO(235, 200, 52, 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                child: TabBar(
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Tab 1"),
                    Tab(text: "Tab 2"),
                    Tab(text: "Tab 3"),
                  ],
                ),
              ),
              TabBarView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Center(child: Text("1")),
                  Center(child: Text("2")),
                  Center(child: Text("3")),
                ],
              ),
            ],
//          TabBarView(
//            physics: ClampingScrollPhysics(),
//            children: <Widget>[
//              Center(child: Text("1")),
//              Center(child: Text("2")),
//              Center(child: Text("3")),
//            ],
//          ),
//        ),
//        ),
          ),
        ),
      ),
    );
  }
}
