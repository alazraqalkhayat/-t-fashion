import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';

class EndDrawerListTile extends StatelessWidget {
  late String title,icon_name;
  late Function onTap;

  EndDrawerListTile(
      {required this.title, required this.icon_name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      trailing: SvgPicture.asset("${kIconsPath}$icon_name"),
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: kEndDrawerTitleColor,
          fontFamily: AppTheme.fontFamily,

        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
