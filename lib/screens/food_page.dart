import 'package:deliver_test_app/models/additional_food_model.dart';
import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/widgets/additional_food.dart';
import 'package:deliver_test_app/widgets/buy_btn.dart';
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
  ScrollController _scrollViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollViewController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              floating: true,
              snap: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),
              actions: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white),
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                    size: 30.0,
                  ),
                )
              ],
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
          ];
        },
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 42.0, top: 40.0),
                    child: Icon(
                      Icons.favorite_border,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              FoodInfo(widget.food),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
                child: Text(
                  widget.food.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              buyButton(),
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
                    AdditionalFoodWidget(additionalFoods),
                    AdditionalFoodWidget(additionalFoods),
                    AdditionalFoodWidget(additionalFoods),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
