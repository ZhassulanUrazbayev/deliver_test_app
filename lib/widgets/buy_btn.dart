import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

Widget BuyButton(){
  Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 42.0, vertical: 15.0),
    child: RaisedButton(
      onPressed: () {},
      padding: EdgeInsets.symmetric(vertical: 18.0),
      textColor: Colors.black,
      elevation: 0.0,
      child: Text(
        Constants.buy,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
      color: Color.fromRGBO(235, 200, 52, 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),
    ),
  );
}