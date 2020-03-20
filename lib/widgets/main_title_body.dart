import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

Widget mainTitleBody(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
            left: 42.0, top: 60.0, bottom: 15.0),
        child: Text(
          Constants.mainTitle,
          style: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w500),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 42.0,
          right: 42.0,
          top: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              size: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Constants.searchHint),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}