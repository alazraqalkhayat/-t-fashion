import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_fashion/core/others/Constants.dart';

class SavedLocationWidget extends StatelessWidget {
  late double mediaHeight, mediaWidth;
  late Widget locationName, locationDescription;
  late Function onPressedRemoveIcon, onTap;

  SavedLocationWidget(
      {required this.locationName,
      required this.locationDescription,
      required this.onTap,
      required this.onPressedRemoveIcon});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return Container(
      height: mediaHeight / 10,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: kTextFormFiledBorderColor, width: 1)),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              onTap: (){
                onTap();
              },
              title: locationName,
              subtitle: locationDescription,
              trailing: SvgPicture.asset("${kIconsPath}gps.svg"),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: SvgPicture.asset("${kIconsPath}Delete.svg"),
              onTap: () {
                onPressedRemoveIcon();
              },
            ),
          )
        ],
      ),
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQueryData().orientation;
    if (orientation == Orientation.landscape) {
      mediaHeight = MediaQuery.of(context).size.width;
      mediaWidth = MediaQuery.of(context).size.height;
    } else {
      mediaHeight = MediaQuery.of(context).size.height;
      mediaWidth = MediaQuery.of(context).size.width;
    }
  }
}
