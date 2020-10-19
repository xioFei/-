import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_trip/Pages/HomePage.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _selectColor = Colors.blue;
  final _fontSize = 14;
  int _selectIndex = 0;
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _selectIndex = index;
            });
        },
        currentIndex: _selectIndex,
        items: [
          BottomNavigationBarItem(
            label: '首页',
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _selectColor),
          ),
          BottomNavigationBarItem(
            label: '搜索',
            icon: Icon(Icons.search, color: _defaultColor),
            activeIcon: Icon(Icons.search, color: _selectColor),
          ),
        ],
      ),
    );
  }
}