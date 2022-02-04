import 'package:flutter/material.dart';

var theme = ThemeData(

    primarySwatch: Colors.blue,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      elevation: 1,

    )
  ),

    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,

      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),

      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),

    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.black),
    )



);


