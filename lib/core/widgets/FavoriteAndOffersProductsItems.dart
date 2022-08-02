import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';

import 'texts/OverFlowText.dart';
import 'texts/SubTitleText.dart';

class FavoriteAndOffersProductsItems extends StatelessWidget {
  late String title, subTitle, price;
  late Function onTap;
  late double mediaHeight, mediaWidth;

  FavoriteAndOffersProductsItems(
      {required this.title,
      required this.subTitle,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return Container(
      margin:EdgeInsets.only(top: mediaHeight/50) ,
      child: Column(
        children: [
          GestureDetector(
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: mediaHeight / 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: Container(
                        height: mediaHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("${kImagesPath}productBackground.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            "${kImagesPath}gallery1.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          SizedBox(height:30,),


                          Expanded(
                            flex: 2,
                            child: SubTitleText(subTitle: title, fontSize: 20,color: kMyGrey,),
                          ),
                          Expanded(
                            flex: 2,

                            child: OverFlowText(title: subTitle,maxLine: 2,),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              price,
                              style: TextStyle(color: AppTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              onTap();
            },
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
