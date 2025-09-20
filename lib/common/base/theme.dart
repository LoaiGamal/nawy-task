import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppTheme {
  static MyAppTheme get instance => _getInstance();

  static MyAppTheme? _instance;

  MyAppTheme._internal();

  static MyAppTheme _getInstance() {
    _instance ??= MyAppTheme._internal();
    return _instance!;
  }

  BuildContext? context;

  ///
  final Color _primaryColor = const Color(0xFF0C314E);

  Color get primaryColor => _primaryColor;

  Color get blueColor => const Color(0xFF0179CB);

  Color get lightGrayColor => const Color(0xFF7E7E7E);

  Color get grayColor => const Color(0xFF545A60);

  Color get lightBlueColor => const Color(0xFFA9C7DB);

  Color get orangeColor => const Color(0xFFFF5E00);

  TextStyle appBarTitleStyle() => TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle defaultStyle() => TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      );

  TextStyle titleStyle() => TextStyle(
        fontSize: 16.sp,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      );

  TextStyle detailTextStyle() => TextStyle(
        fontSize: 14.sp,
        color: lightGrayColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle hintTextStyle() => TextStyle(
        fontSize: 12.sp,
        color: lightGrayColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle largeTextStyle() => TextStyle(
        fontSize: 20.sp,
        color: orangeColor,
        fontWeight: FontWeight.bold,
      );

  ///primary padding
  EdgeInsetsGeometry get primaryPadding =>
      EdgeInsets.symmetric(horizontal: 16.w);

  EdgeInsetsGeometry get allPadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h);

  EdgeInsetsGeometry get zeroPadding => const EdgeInsets.all(0);

  ///primary padding
  EdgeInsetsGeometry get cardPadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);

  ///
  DividerThemeData get dividerThemeData => const DividerThemeData(
        color: Color(0xFFF8F8F8),
        thickness: 1,
      );

  ///
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
      );
}
