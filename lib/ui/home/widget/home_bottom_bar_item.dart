import 'package:flutter/material.dart';

class HomeBottomBarItem extends BottomNavigationBarItem {
  HomeBottomBarItem({
    required String activeAsset,
    required String label,
    required String inactiveAsset,
    double iconWidth = 20,
    double iconHeight = 20,
    double marginTop = 20,
  }) : super(
         icon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 0),
           child: Image.asset(
             inactiveAsset,
             width: iconWidth,
             height: iconHeight,
           ),
         ),
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 0),
           child: Image.asset(
             activeAsset,
             width: iconWidth,
             height: iconHeight,
           ),
         ),
         label: label,
       );
}
