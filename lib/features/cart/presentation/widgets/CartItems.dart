import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class CartItems extends StatelessWidget {
  late double mediaHeight, mediaWidth;
  late String productName, price;
  late int count;
  late Function onTapRemoveButton, onTapIncreaseButton, onTapDecreesButton;

  CartItems(
      {required this.productName,
      required this.price,
      required this.count,
      required this.onTapRemoveButton,
      required this.onTapIncreaseButton,
      required this.onTapDecreesButton});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return Column(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: mediaHeight / 5,
          width: double.infinity,
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Container(
                  height: mediaHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("${kImagesPath}productBackground.jpg"),
                      fit: BoxFit.cover,
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
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubTitleText(
                            subTitle: productName,
                            fontSize: 15,
                            color: kMyGrey,
                          ),
                          GestureDetector(
                            child: SvgPicture.asset("${kIconsPath}Delete.svg"),
                            onTap: (){
                              onTapRemoveButton();

                            },
                          ),
                        ],
                      ),

                    ),
                    Expanded(
                        flex: 1,
                        child: SubTitleText(
                          subTitle: price,
                          color: AppTheme.primaryColor,
                          fontSize: 15,
                        )),
                    Expanded(
                      flex: 1,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: SvgPicture.asset("${kIconsPath}up.svg"),
                              onTap: () {
                                onTapIncreaseButton();
                              },
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SubTitleText(
                                subTitle: count.toString(),
                                color: AppTheme.primaryColor,
                                fontSize: 15,
                              )),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: SvgPicture.asset(
                                "${kIconsPath}down.svg",
                              ),
                              onTap: () {
                                onTapDecreesButton();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: kMyGrey,
        ),
        SizedBox(
          height: 10,
        )
      ],
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
