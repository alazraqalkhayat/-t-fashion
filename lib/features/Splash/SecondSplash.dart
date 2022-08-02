import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

import 'widgets/SplashesWidget.dart';

class SecondSplash extends StatelessWidget {
  late double mediaHeight, mediaWidth;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return SplashesWidget(
      firstTitle: "قم بشراء جميع المنتجات والدفع عند التوصيل",
      imagePath: "secondSplashImage.png",
      child: Column(
        children: [
          SubTitleText(
            subTitle:
            "قم بشراء جميع المنتجات والدفع عند التوصيل قم بشراء جميع المنتجات والدفع عند التوصيل قم بشراء جميع المنتجات والدفع عند التوصيل قم بشراء جميع المنتجات والدفع عند التوصيل",
            fontSize: 15,
            color: kMyGrey,
          ),

          Container(
            margin: EdgeInsets.only(top: mediaHeight/10),
            child: Image(
              image: AssetImage("${kImagesPath}first_splash_icon.png"),
            ),
          ),

        ],
      ),
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
