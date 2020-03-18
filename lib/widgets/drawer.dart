import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            _createHeader("Adrey Popov"),
            _createDrawerItem(text: Constants.allMenu, isBasket: false, amount: ""),
            _createDrawerItem(text: Constants.orders, isBasket: false, amount: "6"),
            _createDrawerItem(text: Constants.basket, isBasket: true, amount: "3"),
          ],
        ),
      ),
    );
  }

  Widget _createHeader(String text) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
          margin: EdgeInsets.zero,
          child: Center(
            child: _createHeaderItem(icon: Icons.person_outline, name: text, email: "test1@gmail.com"),
          )),
    );
  }

  Widget _createDrawerItem(
      {String text, bool isBasket, String amount, GestureTapCallback onTap}) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15.0,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
              child: Text(
                amount,
                style: TextStyle(
                  color: isBasket ? Colors.black : Colors.grey,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: isBasket ? Colors.yellow : Colors.transparent,
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _createHeaderItem(
      {IconData icon, String name, String email, GestureTapCallback onTap}) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0),
                ),
                Text(
                  email,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0),
                ),
              ],
            ),
            Icon(
              Icons.exit_to_app,
              color: Colors.black,
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
