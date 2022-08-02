import 'package:flutter/material.dart';

class ProductColor extends StatelessWidget {

  late Color backGroundColor;
  late Function onTap;


  ProductColor({required this.backGroundColor,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 10,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
      ),
      onTap: (){
        onTap();
      },
    );
  }
}
