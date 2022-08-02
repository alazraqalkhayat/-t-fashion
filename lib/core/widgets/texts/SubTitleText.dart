
import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';

class SubTitleText extends StatelessWidget {

  late String subTitle;
  late double fontSize;
  late Color color;

  SubTitleText({required this.subTitle,required this.fontSize,required this.color});

  @override
  Widget build(BuildContext context) {
    return  Text(
      subTitle,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: AppTheme.fontFamily
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
