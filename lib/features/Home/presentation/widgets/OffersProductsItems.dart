import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/OverFlowText.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/features/Home/presentation/widgets/ProductPriceText.dart';



class OffersProductsItems extends StatelessWidget {
  late String productName, description, oldPrice, newPrice;
  late Function onTap;

  late double mediaHeight,mediaWidth;

  OffersProductsItems(
      {required this.productName,
      required this.description,
      required this.oldPrice,
      required this.newPrice,
      required this.onTap});


  @override
  Widget build(BuildContext context) {

    checkOrientation(context);
    return Container(
      margin: EdgeInsets.only(left: mediaWidth/30,right: mediaWidth/30),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Material(
              elevation: 10,borderRadius: BorderRadius.all(Radius.circular(20),),
              child: Container(

                height: mediaHeight / 4,
                width: mediaWidth / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),




                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("${kImagesPath}productBackground.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Image(
                          image: AssetImage(
                            "${kImagesPath}prod_2.png",
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(height:30,),


                          Expanded(
                            flex: 2,
                            child: SubTitleText(
                              subTitle: "حذاء رياضي",
                              fontSize: 20,
                              color: kMyGrey,
                            ),

                          ),
                          Expanded(
                            flex: 2,
                            child: OverFlowText(
                              title: "حذاء رياضي  مريح و انيق حذاء رياضي  مريح و انيق حذاء رياضي  مريح و انيق",
                              maxLine: 2,
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: ProductPriceText(
                              oldPrice: oldPrice,
                              newPrice: newPrice,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          onTap();
        },
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
