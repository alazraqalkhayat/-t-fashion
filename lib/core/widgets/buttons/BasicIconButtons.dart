import 'package:flutter/material.dart';

class BasicIconButtons extends StatelessWidget {
  late IconData icon;
  late Color iconColor;
  late double iconSize;
  late Function onPressed;

  BasicIconButtons({required this.icon,required this.onPressed,required this.iconColor,required this.iconSize});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        icon,
        color: iconColor,
        size:iconSize,
      ),
    );
  }
}
