import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';

class TapedText extends StatelessWidget {

  late String text;
  late Color color;
  late Function onTap;


  TapedText({required this.text,required this.color,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(
            color: color, fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily
        ),
      ),
      onTap: () {
        onTap();
      },
    );

  }
}
