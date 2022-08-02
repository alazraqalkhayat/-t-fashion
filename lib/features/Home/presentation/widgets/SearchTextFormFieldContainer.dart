
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';

class SearchTextFormFieldContainer extends StatelessWidget {


  var onChange = (newValue) {};


  SearchTextFormFieldContainer({required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/20,
      width: MediaQuery.of(context).size.width/1,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: kTextFormFiledBorderColor, style: BorderStyle.solid
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),

      ),
      child: TextFormField(
        style:TextStyle(
          color: AppTheme.primaryColor,
          fontFamily: AppTheme.fontFamily
        ) ,

        textDirection: TextDirection.rtl,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: MediaQuery.of(context).size.longestSide),
          suffixIcon: SvgPicture.asset("${kIconsPath}search.svg",fit: BoxFit.scaleDown,),
          border: InputBorder.none,
          hintText: "بحث",
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: kTextFormFiledHintColor),

        ),

        // controller: myController,
        onChanged: onChange
      ),
    );
  }
}
