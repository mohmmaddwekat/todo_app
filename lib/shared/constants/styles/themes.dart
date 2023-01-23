 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/constants/styles/styles.dart';


ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkColor,
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: IconThemeData(
        color: lightColor,
      ),
      backgroundColor: darkColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: lightColor,
      ),
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      backgroundColor: darkColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor,
    ),
    primarySwatch: defaultColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: lightColor,
      ),
    ),
    iconTheme: IconThemeData(
      color: defaultColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          )
      ),
      iconColor: defaultColor,

    ),
    fontFamily: 'Roboto',
  );

 ThemeData lightTheme = ThemeData(
   scaffoldBackgroundColor: lightColor,
   appBarTheme: AppBarTheme(
     titleSpacing: 20.0,
     iconTheme: IconThemeData(
       color: darkColor,
     ),
     backgroundColor: lightColor,
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: lightColor,
       statusBarIconBrightness: Brightness.dark,
     ),
     titleTextStyle: TextStyle(
       fontSize: 20.0,
       fontWeight: FontWeight.bold,
       color: darkColor,
     ),
     elevation: 0.0,
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     type: BottomNavigationBarType.fixed,
     selectedItemColor: defaultColor,
     backgroundColor: lightColor,
     unselectedItemColor: greyColor,
     elevation: 20.0,
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor: defaultColor,
   ),
   primarySwatch: defaultColor,
   textTheme: TextTheme(
     bodyText1: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.bold,
       color: darkColor,
     ),
   ),
   iconTheme: IconThemeData(
     color: defaultColor,
   ),
   inputDecorationTheme: InputDecorationTheme(
     enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(
           color: darkColor,
         )
     ),
     iconColor: defaultColor,
   ),
   fontFamily: 'Roboto',
 );