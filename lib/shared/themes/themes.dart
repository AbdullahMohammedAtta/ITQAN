import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itqan/shared/Conestants/Conestants.dart';


ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    scaffoldBackgroundColor: defaultBackGroundLightThemeColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: 15.0,
        color: Colors.black,
      ),
    ) ,
    fontFamily: 'Janna',
    appBarTheme:  AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        //statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: defaultBackGroundLightThemeColor,
      ),
      color: defaultBackGroundLightThemeColor,
      elevation: 0.0,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: defaultBackGroundLightThemeColor,
    ),
    cardTheme: CardTheme(
        color:  defaultBackGroundLightThemeColor,
        elevation: 2,
        shadowColor: Colors.white
    ),    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: defaultColor,
    //   splashColor: Colors.red
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: defaultBackGroundLightThemeColor,
    )

);


ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  cardTheme: CardTheme(
      color:  defaultBackGroundDarkThemeColor,
      elevation: 2,
      shadowColor: Colors.white
  ),
  scaffoldBackgroundColor: defaultBackGroundDarkThemeColor,
  //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  appBarTheme:  AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: defaultBackGroundDarkThemeColor,
    ),
    color: defaultBackGroundDarkThemeColor,
    elevation: 0.0,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: defaultBackGroundDarkThemeColor,
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //     backgroundColor: Color(CacheHelper.getData(key: 'color')?? Colors.blue.value),
  //     splashColor: Colors.red
  // ),
  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 15.0,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Janna',
  cardColor: const Color.fromRGBO(66, 66, 66, 1.0),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    backgroundColor: defaultBackGroundDarkThemeColor,
  )
);


