import 'package:deliver_test_app/models/additional_food_model.dart';
import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/widgets/food_description.dart';
import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

class CollapsingAppBar extends StatefulWidget {
  @override
  _CollapsingAppBarState createState() => _CollapsingAppBarState();
}

class _CollapsingAppBarState extends State<CollapsingAppBar>
    with SingleTickerProviderStateMixin {
  Food food = foods[0];
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
                  FoodInfo(food),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                    child: Text(
                      food.description,
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
                      controller: _controller,
                      tabs: [
                        new Tab(
                          child: Text(
                            "dfasdf",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        new Tab(
                          child: Text(
                            "dfasdf",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        new Tab(
                          child: Text(
                            "dfasdf",
                            style: TextStyle(color: Colors.black),
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
                                                    fontWeight:
                                                        FontWeight.bold,
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
