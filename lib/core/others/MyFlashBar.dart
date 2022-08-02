import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFlashBar{

  late String title,message;
  late Function thenDo;
  late BuildContext context;

  MyFlashBar({required this.title, required this.message,required this.thenDo,required this.context});

  showFlashBar() {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      boxShadows: [
        BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 20.0,
            spreadRadius: 20.0)
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      titleText: Text(
        title,
      ),
      messageText: Text(message),
      margin: EdgeInsets.all(12.0),
      borderRadius: 8,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          Icons.check_circle,
          color: Colors.red,
          // size: ScreenUtil.orientation == Orientation.portrait ? ScreenUtil.screenWidth * .1 : ScreenUtil.screenHeight * .1,
          size: 20,
        ),
      ),

      backgroundColor: Colors.white,
      duration: Duration(seconds: 2),
    ).show(context).then((value) {
      return thenDo();
    });
  }

}