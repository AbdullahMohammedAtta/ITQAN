import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itqan/Pages/home_page.dart';
import 'package:itqan/shared/cache_helper/shared_preferences.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (route) {return false;},
);

void signOut(context)
{
  CacheHelper.removerData(key: 'token').then((value)
  {
    if(value)
    {
      navigateAndFinish(context, const HomePage());
    }
  });
}


enum ToastState{SUCCESS,WRONG,WARNING}
Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.WRONG:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
void showToast({required String text,required ToastState state})
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}