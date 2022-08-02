import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/FavoriteAndOffersProductsItems.dart';
import 'package:t_fashion/core/widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/core/widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class OffersRoute extends StatefulWidget {
  @override
  _OffersRouteState createState() => _OffersRouteState();
}

class _OffersRouteState extends State<OffersRoute> {
  List<String> categories = [
    "رجالي",
    "نسائي",
    "اطفال",
    "اثاث",
    "ادوات منزليه",
    "عمر",
    "الكترونيات",
    "اقمشه"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BasicScreenStyle(
          paddingTop: 40,
          rightSideIconButton: BasicIconButtons(
            icon: Icons.arrow_forward_ios,
            iconColor: Colors.white,
            iconSize: 30,
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),

          middleWidget: SubTitleText(
            subTitle: "العروض",
            fontSize: 30,
            color: Colors.white,
          ),
          leftSideIconButton: BasicIconButtons(
            icon: Icons.filter_list_alt,
            iconColor: AppTheme.primaryColor,
            iconSize: 30,
            onPressed: () {
              setState(() {
                print("filter pressed ");
              });
            },
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Expanded(
                    child: DefaultTabController(
                  length: categories.length,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: PreferredSize(
                      preferredSize:
                          Size.fromHeight(MediaQuery.of(context).size.height),
                      child: Container(
                        height: 50.0,
                        child: TabBar(
                          labelColor: AppTheme.primaryColor,
                          indicatorColor: AppTheme.primaryColor,
                          unselectedLabelColor: Colors.black,
                          isScrollable: true,
                          tabs: List<Widget>.generate(categories.length,
                              (int index) {
                            return Tab(text: categories[index]);
                          }),
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children:
                          List<Widget>.generate(categories.length, (int index) {
                        return FavoriteAndOffersProductsItems(
                          title: categories[index],
                          subTitle: categories[index],
                          price: "35\$",
                          onTap: (){

                          },
                        );
                      }),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
