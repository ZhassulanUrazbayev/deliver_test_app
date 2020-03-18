import 'package:deliver_test_app/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

Widget FoodInfo(Food food){
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 40.0, vertical: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(food.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star_border,
                  size: 20.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  food.overviewScore.toString(),
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '(${food.overviewAmount}+)',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${food.timeFrom}-${food.timeTo}',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ${Constants.timeUnitMin}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          width: 40.0,
        ),
        Text(
          '${Constants.rubleSymbol} ',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15.0),
        ),
        Text(
          food.price.toString(),
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}