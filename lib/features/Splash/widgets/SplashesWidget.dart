import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';


class SplashesWidget extends StatelessWidget {
  late double mediaHeight;
  late double mediaWidth;

  late Widget child;
  late String firstTitle;
  late String imagePath;

  SplashesWidget(
      {required this.firstTitle, required this.imagePath, required this.child});
  var _orientation;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: _orientation=="portrait"?mediaWidth / 5:mediaWidth/2,
            right: _orientation=="portrait"?mediaWidth / 5:mediaWidth/2,
            top: _orientation=="portrait"?mediaHeight / 20:mediaHeight/20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: mediaHeight / 4,
                width: mediaWidth / 2,
                child: Image(
                  image: AssetImage("${kImagesPath}${imagePath}"),
                ),
              ),
              SizedBox(
                height: mediaHeight/16,
              ),
              SubTitleText(
                subTitle: firstTitle,
                fontSize: 17,
                color: kMyGrey,
              ),
              SizedBox(
                height: mediaHeight/16,
              ),
              child
            ],
          ),
        ),
      )),
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      mediaWidth = MediaQuery.of(context).size.height;
      mediaHeight = MediaQuery.of(context).size.height;
      _orientation = "landscape";
    } else {
      mediaWidth = MediaQuery.of(context).size.width;
      mediaHeight = MediaQuery.of(context).size.height;
      _orientation = "portrait";
    }
  }
}
