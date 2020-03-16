import 'dart:ui';

import 'package:deliver_test_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200.0,
            child: FittedBox(
              child: Image.network(
                  "https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cheese Pittasdfasdfas',
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
                          '4,5',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '(100+)',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '25-30',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' min',
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
                  '₽ ',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
                ),
                Text(
                  '300',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 15.0),
            child: RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 18.0),
              textColor: Colors.black,
              elevation: 0.0,
              child: Text('Купить', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
              color: Color.fromRGBO(235, 200, 52, 0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),),
            ),
          )
        ],
      ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
            Colors.white,
          ),
          child: AppDrawer(),
        )
    );
  }
}
