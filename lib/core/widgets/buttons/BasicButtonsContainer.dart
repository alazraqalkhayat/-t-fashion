import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';

class BasicButtonsContainer extends StatelessWidget {
  late String title;
  late Function onTap;
  late Color backgroundColor;
  late Color textColor;
  BasicButtonsContainer({required this.title, this.backgroundColor=AppTheme.primaryColor,this.textColor=Colors.white,required this.onTap});
  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return Container(
      height: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().screenHeight / 15:ScreenUtil().screenWidth/15,
      width:ScreenUtil().orientation==Orientation.portrait?ScreenUtil().screenWidth / 1.9:ScreenUtil().screenHeight/ 1.9,
      margin: EdgeInsets.only(top:  ScreenUtil().orientation==Orientation.portrait?ScreenUtil().screenHeight / 20:ScreenUtil().screenWidth/20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: FlatButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
           style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: AppTheme.fontFamily
          ),
        ),
      ),
    );
  }
}
