import 'dart:ui';
import 'package:deliver_test_app/screens/food_page.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;
import 'package:deliver_test_app/models/food_model.dart';
import 'package:deliver_test_app/screens/animation.dart';
import 'package:deliver_test_app/widgets/buy_btn.dart';
import 'package:deliver_test_app/widgets/drawer.dart';
import 'package:deliver_test_app/widgets/food_description.dart';
import 'package:deliver_test_app/widgets/main_title_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  int _selectedIndex = 0;

  List<String> _icons = [
    "assets/images/lunch.png",
    "assets/images/pizza.png",
    "assets/images/kebab.png",
    "assets/images/hamburger.png"
  ];

  List<String> _iconsName = ["Все", "Пицца", "Кебаб", "Бургер"];

  String _currentlySelected = "";

  bool _isExpanded = true;
  bool _isStaticBodyVisible = false;

  void _toogleExpand(int index) {
    setState(() {
      if (index != 0) {
        _isStaticBodyVisible = true;
        _isExpanded = false;
      } else {
        _isExpanded = true;
      }
    });
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _toogleExpand(index);
        });
      },
      child: Container(
        height: 80.0,
        width: 80.0,
        child: Column(
          children: <Widget>[
            ImageIcon(
              AssetImage(_icons[index]),
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
              Container(
                child: Visibility(
                  visible: _isStaticBodyVisible,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: ExpandedSection(
                    expand: _isExpanded,
                    child:
                        !_isStaticBodyVisible ? Container() : mainTitleBody(),
                  ),
                ),
              ),
              Visibility(
                visible: !_isStaticBodyVisible,
                child: mainTitleBody(),
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
                          buyButton(),
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
