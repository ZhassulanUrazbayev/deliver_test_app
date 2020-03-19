import 'package:deliver_test_app/models/additional_food_model.dart';
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

class _FoodPageState extends State<FoodPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.white),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0.0,
              expandedHeight: 320,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
                  // <===   Add your own image to assets or use a .network image instead.
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  FoodInfo(widget.food),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                    child: Text(
                      widget.food.description,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                    child: RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      textColor: Colors.black,
                      elevation: 0.0,
                      child: Text(
                        Constants.buy,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      color: Color.fromRGBO(235, 200, 52, 0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 42.0),
                    child: new TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      controller: _controller,
                      tabs: [
                        new Tab(
                          child: Text(
                            Constants.additionalName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        new Tab(
                          child: Text(
                            Constants.similarName,
                          ),
                        ),
                        new Tab(
                          child: Text(
                            Constants.reviewName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 42.0),
                          child: ListView.builder(
                            itemCount: additionalFoods.length,
                            itemBuilder: (BuildContext context, int index) {
                              AdditionalFood additionalFood =
                                  additionalFoods[index];
                              return Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage(
                                            additionalFood.imageUrl),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                additionalFood.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0),
                                              ),
//                                              SizedBox(
//                                                width: 80,
//                                              ),
                                              Text(
                                                "${additionalFood.price.toString()} ${Constants.rubleName}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0),
                                              )
                                            ],
                                          ),
                                          Text(
                                            additionalFood.description,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Text("2"),
                        Text("3"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
