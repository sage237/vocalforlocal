import 'package:flutter/material.dart';

class Responsive {
  static dynamic _mediaQueryData; //MediaQueryData
  static dynamic screenWidth; //double
  static dynamic screenHeight; //double
  static dynamic blockSizeHorizontal; //double
  static dynamic blockSizeVertical; //double

  static dynamic _safeAreaHorizontal; //double
  static dynamic _safeAreaVertical; //double
  static dynamic safeBlockHorizontal; //double
  static dynamic safeBlockVertical; //double
  static dynamic safeBlockVerticalWAB; //double with appbar
  static dynamic toppad; //double with appbar

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    toppad = _mediaQueryData.padding.top;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    safeBlockVerticalWAB =
        (screenHeight - _safeAreaVertical - AppBar().preferredSize.height) /
            100;
  }
}
