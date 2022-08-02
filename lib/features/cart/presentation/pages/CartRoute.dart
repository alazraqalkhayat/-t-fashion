import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/core/widgets/drawer/EndDrawerWidget.dart';
import 'package:t_fashion/core/widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/features/cart/presentation/widgets/CartItems.dart';


class CartRoute extends StatefulWidget {

  @override
  _CartRouteState createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {

  List<int> counts=[1,1,1,1,1,1,1,1,1,1,1,1,1,];
  var count=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        key: kCartRouteScaffoldKey,
        endDrawer: EndDrawerWidget(currentRoute: "السله",),
        body: BasicScreenStyle(
          paddingTop: 20,
          rightSideIconButton: GestureDetector(
            child: SvgPicture.asset("${kIconsPath}menu.svg"),
            onTap: (){
              kCartRouteScaffoldKey.currentState!.openEndDrawer();
            },
          ),

          middleWidget: SubTitleText(
            subTitle: "السله",
            fontSize: 30,
            color: Colors.white,
          ),
          leftSideIconButton: BasicIconButtons(
            icon: Icons.filter_list_alt,
            iconColor: AppTheme.primaryColor,
            iconSize: 30,
            onPressed: (){
              setState(() {
                print("asdf");
              });
            },
          ),

          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: ListView.builder(

                    itemCount: counts.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CartItems(
                        productName: "جاكيت شتوي",
                        price: "50\$",
                        count: counts[index],
                        onTapRemoveButton: (){
                          setState(() {
                            print("remove");
                          });
                        },
                        onTapIncreaseButton: (){
                          setState(() {
                            print("up");
                            counts[index]++;
                          });
                        },
                        onTapDecreesButton: (){
                          setState(() {
                            print("down");
                            counts[index]>1?counts[index]--:counts[index]==0?counts[index]++:print("can not decrees : count is ${counts[index]}");
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicButtonsContainer(
                          title: "عرض الفاتوره",
                          backgroundColor: AppTheme.primaryColor,
                          textColor: Colors.white,
                          onTap: (){
                            Navigator.pushNamed(context, kInvoiceRoute);
                          },
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: BasicButtonsContainer(
                          title: "خدمه التوصيل",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.primaryColor,
                          onTap: (){
                            Navigator.pushNamed(context, kSavedLocationRoute);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
        ),

    );
  }
}
