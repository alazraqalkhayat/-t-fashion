import 'package:flutter/material.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';


class InvoiceDetails extends StatelessWidget {

  late String rightSideText,leftSideText;
  late Color rightSideColor,leftSideColor;


  InvoiceDetails({required this.rightSideText,required this.leftSideText,required this.rightSideColor,required this.leftSideColor});

  @override
  Widget build(BuildContext context) {

    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubTitleText(
          subTitle: rightSideText,
          fontSize: 15,
          color: rightSideColor,
        ),

        SubTitleText(
          subTitle: leftSideText,
          fontSize: 15,
          color: leftSideColor,
        ),
      ],
    );
  }


}
