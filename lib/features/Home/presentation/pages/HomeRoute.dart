import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/EndOfListContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/core/widgets/drawer/EndDrawerWidget.dart';
import 'package:t_fashion/core/widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/features/Home/presentation/widgets/BasicCategoriesItems.dart';
import 'package:t_fashion/features/Home/presentation/widgets/DownloadsProductsItems.dart';
import 'package:t_fashion/features/Home/presentation/widgets/OffersProductsItems.dart';
import 'package:t_fashion/features/Home/presentation/widgets/SearchTextFormFieldContainer.dart';

class HomeRoute extends StatelessWidget{
  late double mediaHeight, mediaWidth;

  List<String> offersList = [
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
  ];
  List<String> lastDownloads = [
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
    "حذاء رباضي",
  ];
  List<String> categoties = [
    "رجالي",
    "نسائي",
    "اطفال",
  ];

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return SafeArea(
      child: Scaffold(
        key: kHomeRouteScaffoldKey,
        endDrawer: EndDrawerWidget(
          currentRoute: "الرئيسيه",
        ),
        body:BasicScreenStyle(
                  paddingTop: 20,
                  rightSideIconButton: GestureDetector(
                    child: SvgPicture.asset("${kIconsPath}menu.svg"),
                    onTap: (){
                      kHomeRouteScaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  middleWidget: SearchTextFormFieldContainer(
                    onChange: (newValue) {
                    },
                  ),
                  leftSideIconButton: BasicIconButtons(
                    icon: Icons.filter_list_alt,
                    iconColor: AppTheme.primaryColor,
                    iconSize: 30,
                    onPressed: () {
                      print("filter pressed");
                    },
                  ),
                  child: SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SubTitleText(
                          subTitle: "كل العروض",
                          fontSize: 15,
                          color: kMyGrey,
                        ),
                        SizedBox(
                          height: mediaHeight / 3.5,
                          child: ListView.builder(
                              itemCount: offersList.length > 5
                                  ? offersList.length - (offersList.length - 6)
                                  : offersList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (offersList.length >= 6) {
                                  if (index <= 4) {
                                    return OffersProductsItems(
                                      productName: offersList[index],
                                      description: "حذاء رياضي  مريح و انيق",
                                      oldPrice: "40",
                                      newPrice: "30",
                                      onTap: () {
                                        Navigator.pushNamed(context, kProductDetailsRoute);
                                      },
                                    );
                                  } else {
                                    return EndOfListContainer(
                                        title: "كل العروض",
                                        onTap: () {
                                          Navigator.pushNamed(context, kOffersRoute);
                                        });
                                  }
                                } else {
                                  return  OffersProductsItems(
                                      productName: offersList[index],
                                      description: "حذاء رياضي  مريح و انيق",
                                      oldPrice: "40",
                                      newPrice: "30",
                                      onTap: () {
                                        Navigator.pushNamed(context, kProductDetailsRoute);
                                      });
                                }
                              }


                          ),
                        ),
                        SubTitleText(
                          subTitle: "اخر التنزيلات",
                          fontSize: 15,
                          color: kMyGrey,
                        ),
                        SizedBox(
                          height: mediaHeight / 3.5,
                          child: ListView.builder(
                            itemCount: lastDownloads.length > 5
                                ? lastDownloads.length - (lastDownloads.length - 6)
                                : lastDownloads.length,
                            scrollDirection: Axis.horizontal,

                            itemBuilder: (context, index) {
                              if (lastDownloads.length >= 6) {
                                if (index <= 4) {
                                  return DownloadsProductsItems(
                                    productName: lastDownloads[index],
                                    description: "حذاء رياضي  مريح و انيق",
                                    price: "40",
                                    onTap: () {
                                      Navigator.pushNamed(context, kProductDetailsRoute);
                                    },
                                  );
                                } else {
                                  return EndOfListContainer(
                                      title: "كل العروض",
                                      onTap: () {
                                        Navigator.pushNamed(context, kOffersRoute);
                                      });
                                }
                              } else {
                                return  DownloadsProductsItems(
                                    productName: offersList[index],
                                    description: "حذاء رياضي  مريح و انيق",
                                    price: "40",
                                    onTap: () {
                                      Navigator.pushNamed(context, kProductDetailsRoute);
                                    });
                              }
                            },
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        SubTitleText(
                          subTitle: "التصنيفات",
                          fontSize: 15,
                          color: kMyGrey,
                        ),
                        SizedBox(
                          height: mediaHeight / 4,
                          child: ListView.builder(

                            itemCount: categoties.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return BasicCategoriesItems(
                                title: categoties[index],
                                onTap: () {
                                  print("items pressed");
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
            ),
            FloatingActionButton(
              child: SvgPicture.asset('${kIconsPath}shopping_cart.svg'),
              backgroundColor: AppTheme.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, kCartRoute);
              },
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