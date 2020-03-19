import 'dart:ui';
import 'package:deliver_test_app/screens/food_page.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;
import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/screens/animation.dart';
import 'package:deliver_test_app/widgets/buy_btn.dart';
import 'package:deliver_test_app/widgets/drawer.dart';
import 'package:deliver_test_app/widgets/dropdown_cities.dart';
import 'package:deliver_test_app/widgets/food_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  int _selectedIndex = 0;

  List<IconData> _icons = [
    Icons.fastfood,
    Icons.local_pizza,
    Icons.shop,
    Icons.fingerprint
  ];

  List<String> _iconsName = ["Все", "Пицца", "Кебаб", "Бургер"];

  String _currentlySelected = "";

  ///If the box is expanded
  bool _isExpanded = true;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (index != 0) {
            _isExpanded = false;
          } else {
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
            brightness: Brightness.light,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpandedSection(
                expand: _isExpanded,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 42.0, top: 60.0, bottom: 15.0),
                      child: Text(
                        Constants.mainTitle,
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w500),
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
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30.0,
                                  ),
                                  border: InputBorder.none,
                                  hintText: Constants.searchHint),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.0, top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map((MapEntry map) => _buildIcon(map.key))
                      .toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (BuildContext context, int index) {
                    Food food = foods[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FoodPage(
                            food: food,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            child: FittedBox(
                              child: Image.network(food.imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                          FoodInfo(food),
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
