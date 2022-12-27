

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastmessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG

      );
  }

  static void flushBarErrorMessage(String message , BuildContext context){

    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      padding: EdgeInsets.all(15),
      backgroundColor: Colors.red,
      messageColor: Colors.black,
      borderRadius:BorderRadius.circular(10),
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error , size:  28, color: Colors.white,),
    )..show(context),);
  }

  static snackBar(String message , BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor : Colors.red,
        content: Text(message))
    );
  }

}