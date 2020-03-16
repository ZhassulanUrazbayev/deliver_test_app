import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              text: 'Contacts',
            ),
            _createDrawerItem(
              text: 'Events',
            ),
            _createDrawerItem(
              text: 'Notes',
            ),
            _createDrawerItem(text: 'Steps'),
            _createDrawerItem(text: 'Authors'),
            _createDrawerItem(text: 'Flutter Documentation'),
            _createDrawerItem(text: 'Useful Links'),
            _createDrawerItem(text: 'Report an issue'),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return SafeArea(
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(top: 25.0),
          child: Column(children: <Widget>[
            _createHeaderItem(
                icon: Icons.person_outline, text: "Вход/Регистрация"),
            _createHeaderItem(icon: Icons.place, text: "Вход/Регистрация"),
          ])),
    );
  }

  Widget _createDrawerItem({String text, GestureTapCallback onTap}) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
              child: Text('3'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.yellow,
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _createHeaderItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white12),
        ),
      ),
      child: ListTile(
//        leading: Icon(icon, color: Colors.white, size: 24.0,),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0),
              ),
            )
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
