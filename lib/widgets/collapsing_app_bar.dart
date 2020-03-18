import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;
import 'package:deliver_test_app/widgets/food_description.dart';
import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar, this.food);

  final TabBar _tabBar;
  final Food food;

  @override
  double get minExtent => 0;

  @override
  double get maxExtent => 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(height: 5.0,);
//      Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        FoodInfo(food),
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
//          child: Text(
//              food.description,
//          style: TextStyle(fontSize: 16.0),),
//        ),
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
//          child: RaisedButton(
//            onPressed: () {},
//            padding: EdgeInsets.symmetric(vertical: 18.0),
//            textColor: Colors.black,
//            elevation: 0.0,
//            child: Text(
//              Constants.buy,
//              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//            ),
//            color: Color.fromRGBO(235, 200, 52, 0.8),
//            shape: RoundedRectangleBorder(
//              borderRadius: new BorderRadius.circular(20.0),
//            ),
//          ),
//        ),
//        Container(
//          color: Colors.white,
//          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
//          child: _tabBar,
//        ),
//      ],
//    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
