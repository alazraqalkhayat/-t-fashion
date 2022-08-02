import 'package:flutter/material.dart';

class OverFlowText extends StatelessWidget {

  late String title;
  late int maxLine;


  OverFlowText({Key? key, required this.title,required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.caption,
      maxLines: maxLine,
      textAlign: TextAlign.right,
    );
  }
}
