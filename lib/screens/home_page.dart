import 'dart:ui';

import 'package:deliver_test_app/screens/animation.dart';
import 'package:deliver_test_app/widgets/drawer.dart';
import 'package:deliver_test_app/widgets/dropdown_cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    Icons.fastfood,
    Icons.local_pizza,
    Icons.shop,
    Icons.fingerprint
  ];

  List<String> _iconsName = ["Все", "Пицца", "Кебаб", "Бургер"];

  String _currentlySelected = "";

  ///If the box is expanded
  bool _isExpanded = false;

  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if(index != 0){
            _isExpanded = false;
          } else{
            _isExpanded = true;
          }
        });
      },
      child: Container(
        height: 80.0,
        width: 80.0,
        child: Column(
          children: <Widget>[
            Icon(
              _icons[index],
              size: 40.0,
              color: Colors.black87,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              _iconsName[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: _selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdownWidget() {
    return DropdownButton(
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
      onChanged: (String value) {
        setState(() {
          _currentlySelected = value;
        });
      },
      isExpanded: false,
      value: _currentlySelected,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._currentlySelected = _dropdownValues[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            title: DropdownButtonHideUnderline(child: dropdownWidget()),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Icon(Icons.shopping_basket),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedSection(
                expand: _isExpanded,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.0),
                      child: Text(
                        "Голоден?",
                        style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 42.0,
                        right: 42.0,
                        bottom: 40.0,
                        top: 20.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30.0,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Enter a search term'),
                            ),
                          ),
//                TextField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map((MapEntry map) => _buildIcon(map.key))
                      .toList(),
                ),
              ),
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
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
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
                  child: Text(
                    'Купить',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  color: Color.fromRGBO(235, 200, 52, 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: AppDrawer(),
          )),
    );
  }
}
