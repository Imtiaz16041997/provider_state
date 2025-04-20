
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../res/colors/colors.dart';

class Utils {
  static void filedFocusChange(BuildContext context, FocusNode current,
      FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.redColor,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM

    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.CENTER

    );
  }

  static flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context,
      flushbar: Flushbar(
      message: message,
      backgroundColor: AppColor.redColor,
      messageColor: AppColor.blackColor,
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(Icons.error,size: 28,color: Colors.white,),
    )..show(context),
    );
  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
          
        ));
  }

}
