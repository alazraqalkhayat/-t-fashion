import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/app_theme.dart';

class BasicScreenStyle extends StatefulWidget {
  late Widget child, rightSideIconButton, leftSideIconButton,middleWidget;
  late double paddingTop;


  BasicScreenStyle(
      {required this.child,
      required this.rightSideIconButton,
      required this.leftSideIconButton,
      required this.middleWidget,
      required this.paddingTop

      });

  @override
  State<BasicScreenStyle> createState() => _BasicScreenStyleState();
}

class _BasicScreenStyleState extends State<BasicScreenStyle> {
  late double mediaHeight, mediaWidth;

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
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            flex: 1,
                            child: widget.rightSideIconButton,
                          ),
                          Expanded(
                            flex: 2,
                            child:widget.middleWidget,

                          ),
                          Expanded(
                            flex: 1,
                            child: widget.leftSideIconButton,
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(right: mediaWidth/20,top: mediaHeight/widget.paddingTop ,left: mediaWidth/20,bottom: mediaHeight/20),
                    // margin: EdgeInsets.only(top: 170),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(70),
                        ),
                      ),
                      width: double.infinity,
                      child: widget.child
                  ),
                )
              ],
            ),


          ],
        ),
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
