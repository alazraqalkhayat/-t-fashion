import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/features/Splash/ThirdSplash.dart';
import 'FirstSplash.dart';
import 'SecondSplash.dart';

class BasicSplashRoute extends StatelessWidget {
  final controller = PageController(initialPage: 1);
  late SharedPreferences preferences;
  late String isShowed;

  @override
  Widget build(BuildContext context) {

    getData(context);

    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            FirstSplash(),
            SecondSplash(),
            ThirdSplash(),
          ],
        ),
      ),
    );
  }

  Future<void> getData(BuildContext context) async {
    preferences = await SharedPreferences.getInstance();
    isShowed = preferences.getString("Splash") ?? "";
    isShowed=="showed"?Navigator.pushReplacementNamed(context,kHomeRoute):null;

  }

}
