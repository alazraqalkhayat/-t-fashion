import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/common.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/drawer/EndDrawerListTile.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/dataProviders/local_data_provider.dart';
import 'package:t_fashion/features/users/data/model/userModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
class EndDrawerWidget extends StatefulWidget {
  var currentRoute;

  EndDrawerWidget({required this.currentRoute});

  @override
  State<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {


  late String currentRoute, loginAndLogout = "", _orientation;
  String userName = "";

  late SharedPreferences preferences;
  int navigationDrawerHeaderFlex = 2;
  late UserModel? user;

  late LocalDataProvider localDataProvider;
  @override
  void initState() {
    checkLoggedIn().fold((l) {
      user = l;
    }, (r) {
      user = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil().init(context);
    return Drawer(
      child: Stack(
        children: [
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
                flex: _orientation == "portrait"
                    ? navigationDrawerHeaderFlex = 2
                    : navigationDrawerHeaderFlex = 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  height: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().screenHeight / 7:ScreenUtil().screenWidth/7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.blue,
                          backgroundImage:
                              AssetImage("${kImagesPath}image.jpg"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            SubTitleText(
                              subTitle: userName,
                              fontSize: 20,
                              color: Colors.white,
                            ),

                            SizedBox(width: 10,),
                            GestureDetector(
                              child: SvgPicture.asset("${kIconsPath}edit.svg"),
                              onTap: (){
                                print("edit pressed");
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  // margin: EdgeInsets.only(top: 170),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        EndDrawerListTile(
                          title: "الرئيسيه",
                          icon_name: "home.svg",
                          onTap: () {
                            if (widget.currentRoute != "الرئيسيه") {
                              Navigator.pushReplacementNamed(
                                  context, kHomeRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "المفضله",
                          icon_name: "heart.svg",
                          onTap: () {
                            if (widget.currentRoute != "المفضله") {
                              Navigator.pushReplacementNamed(
                                  context, kFavoriteRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "السله",
                          icon_name: "shopping_cart.svg",
                          onTap: () {
                            if (widget.currentRoute != "السله") {
                              Navigator.pushReplacementNamed(
                                  context, kCartRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "الإعدادات",
                          icon_name: "setting.svg",
                          onTap: () {
                            if (widget.currentRoute != "الإعدادات") {
                              Navigator.pushReplacementNamed(
                                  context, kSettings);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "تواصل معنا",
                          icon_name: "mobile.svg",
                          onTap: () {
                            if (widget.currentRoute != "الرئيسيه") {
                              Navigator.pushReplacementNamed(
                                  context, kHomeRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "عن التطبيق",
                          icon_name: "info_circle.svg",
                          onTap: () {
                            final snackBar = SnackBar(
                              padding: EdgeInsets.zero,
                              elevation: 20,
                              backgroundColor: Colors.white,
                              content: Container(
                                height: ScreenUtil().orientation==Orientation.portrait ? ScreenUtil().screenHeight / 2.5: ScreenUtil().screenWidth / 2.8,
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    border:
                                        Border.all(color: kMyGrey, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SubTitleText(
                                      subTitle: "عن التطبيق",
                                      fontSize: 25,
                                      color: AppTheme.primaryColor,
                                    ),
                                    SubTitleText(
                                      subTitle:
                                          "تطبيق T-FAHSION هو احد التطبيقات الذي يقوم بــ والله العظيم صدق ولا مشتيت ..!",
                                      fontSize: 15,
                                      color: kMyGrey,
                                    ),
                                    BasicButtonsContainer(
                                      title: "شكراً",
                                      backgroundColor: AppTheme.primaryColor,
                                      textColor: Colors.white,
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).pop(true);
                          },
                        ),
                        EndDrawerListTile(
                          title: "تقييم التطبيق",
                          icon_name: "Star.svg",
                          onTap: () {
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 5),
                              padding: EdgeInsets.zero,
                              elevation: 20,
                              backgroundColor: Colors.white,
                              content: Container(
                                height: ScreenUtil().orientation==Orientation.portrait ? ScreenUtil().screenHeight / 2.5: ScreenUtil().screenWidth / 2.8,
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    border:
                                        Border.all(color: kMyGrey, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SubTitleText(
                                      subTitle: "قيم التطبيق",
                                      fontSize: 25,
                                      color: AppTheme.primaryColor,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      updateOnDrag: false,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    BasicButtonsContainer(
                                      title: "تقييم",
                                      backgroundColor: AppTheme.primaryColor,
                                      textColor: Colors.white,
                                      onTap: () {
                                        openPlayStore();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.of(context).pop(true);
                          },
                        ),
                        EndDrawerListTile(
                          title: "مشاركه التطبيق",
                          icon_name: "share.svg",
                          onTap: () {
                            print("مشاركه التطبيق");
                          },
                        ),
                        EndDrawerListTile(
                          title: user!=null?'تسجيل الخروج':'تسجيل الدخول',
                          icon_name: user!=null
                              ? "Logout.svg"
                              : "Logout.svg",
                          onTap: () {
                            user!=null
                                ? logout()
                                : login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  logout() async {
    await localDataProvider.clearCache(key: 'USER');
    Navigator.pop(context);
    Navigator.pushNamed(context, kHomeRoute);
  }

  login() {
    Navigator.pushNamed(context, kLoginRoute);
  }

  openPlayStore() async {
    const url =
        'https://play.google.com/store/apps/developer?id=<Developer_ID>';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
