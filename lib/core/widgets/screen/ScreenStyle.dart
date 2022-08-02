import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class ScreenStyle extends StatelessWidget {

  late String title;
  late Widget child;
  late double mediaHeight, mediaWidth;
  ScreenStyle({required this.title,required this.child});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            //Expanded Containers
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: AppTheme.primaryColor,
                  ),
                )
              ],
            ),

            Column(

              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                    height: mediaHeight / 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                          child: SubTitleText(
                            subTitle: title,
                            color: Colors.white,
                            fontSize: 30,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    // margin: EdgeInsets.only(top: 170),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(70),
                        ),
                      ),
                      width: double.infinity,
                      child: child
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }

  checkOrientation(BuildContext context){
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
