import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';

import 'texts/SubTitleText.dart';


class EndOfListContainer extends StatelessWidget {
  late String title;
  late Function onTap;

  late double mediaHeight, mediaWidth;

  EndOfListContainer(
      {required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: mediaHeight / 4,
              width: mediaWidth / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: Icon(Icons.arrow_forward_ios)),
                  SubTitleText(
                    subTitle: title,
                    fontSize: 30,
                    color: kMyGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        onTap();
      },
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      mediaHeight = MediaQuery.of(context).size.width;
      mediaWidth = MediaQuery.of(context).size.height;
    } else {
      mediaHeight = MediaQuery.of(context).size.height;
      mediaWidth = MediaQuery.of(context).size.width;
    }
  }
}
