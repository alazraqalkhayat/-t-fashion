import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class SizeContainer extends StatelessWidget {


  late String size;
  late Color backgroundColor,textColor;
  late Function onTap;

  SizeContainer({required this.size,required this.backgroundColor,required this.textColor,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(

          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: AppTheme.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Center(
            child: SubTitleText(
              subTitle: size,
              color: textColor,
              fontSize: 15,
            ),
          )
      ),


      onTap: (){
        onTap();
      },
    );
  }
}
