import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_trip/Pages/HomePage.dart';
import 'package:flutter_trip/Pages/MyPage.dart';
import 'package:flutter_trip/Pages/SearchPage.dart';
import 'package:flutter_trip/Pages/TrealPage.dart';

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
          SearchPage(),
          TrealPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _selectIndex = index;
            });
        },
        type: BottomNavigationBarType.fixed,
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
          BottomNavigationBarItem(
            label: '旅拍',
            icon: Icon(Icons.photo, color: _defaultColor),
            activeIcon: Icon(Icons.photo, color: _selectColor),
          ),
          BottomNavigationBarItem(
            label: '我的',
            icon: Icon(Icons.account_circle, color: _defaultColor),
            activeIcon: Icon(Icons.account_circle, color: _selectColor),
          ),
        ],
      ),
    );
  }
}