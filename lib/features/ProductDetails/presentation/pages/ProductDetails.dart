import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/features/ProductDetails/presentation/widgets/ProductColor.dart';
import 'package:t_fashion/features/ProductDetails/presentation/widgets/SizeContainer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late double mediaHeight, mediaWidth;
  late Color favIconColor = kMyGrey,
      sizeBackgroundColor = Colors.transparent,
      sizeTextColor = AppTheme.primaryColor;

  List<String> size = [
    'M',
    'S',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  List<int> colors = [
    0xFFF67662,
    0xFF727272,
    0xFF8A8A8A,
    0xFF8A8A8A,
    0xFFF67662,
    0xFF727272,
    0xFF8A8A8A,
    0xFF8A8A8A,
  ];

  int sizesItemsCount = 5, colorsItemsCount = 3;
  late String _orientaion;
  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    // ProductDetailsModel t=ProductDetailsModel();
    // t.changeIconName("gps.svg");

    return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Container(
                height: mediaHeight / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${kImagesPath}productBackground.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "${kImagesPath}gallery1.png",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20,top: 15),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: SvgPicture.asset("${kIconsPath}${''}",)
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: mediaHeight / 4.3),
                padding: EdgeInsets.only(
                  top: mediaHeight / 30,
                  right: mediaWidth / 20,
                  bottom: mediaHeight / 30,
                  left: mediaWidth / 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          SubTitleText(
                            subTitle: "جاكيت شتوي",
                            fontSize: 20,
                            color: kMyGrey,
                          ),
                          SubTitleText(
                            subTitle: "\$50",
                            fontSize: 20,
                            color: AppTheme.primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //start sizes and colors

                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: GridView.count(
                                scrollDirection: Axis.vertical,
                                crossAxisCount: _orientaion == "portrait"
                                    ? sizesItemsCount = 5
                                    : sizesItemsCount = 10,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                children: List.generate(size.length, (index) {
                                  return SizeContainer(
                                    size: size[index],
                                    backgroundColor: sizeBackgroundColor,
                                    textColor: sizeTextColor,
                                    onTap: () {
                                      setState(() {
                                        print("size was taped");
                                      });
                                    },
                                  );
                                }),
                              ),
                              width: mediaWidth / 3,
                              height: _orientaion == "portrait"
                                  ? mediaHeight / 8
                                  : mediaHeight / 12,
                            ),
                            flex: 2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: GridView.count(
                                scrollDirection: Axis.horizontal,
                                crossAxisCount: _orientaion == "portrait"
                                    ? colorsItemsCount = 3
                                    : colorsItemsCount = 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                children: List.generate(colors.length, (index) {
                                  return ProductColor(
                                    backGroundColor: Color(colors[index]),
                                    onTap: () {
                                      setState(() {
                                        print("color was taped");
                                      });
                                    },
                                  );
                                }),
                              ),
                              width: mediaWidth / 4,
                              height: _orientaion == "portrait"
                                  ? mediaHeight / 8
                                  : mediaHeight / 12,
                            ),
                          ),
                        ],
                      ),

                      //end sizes and colors

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color: AppTheme.primaryColor,
                      ),

                      //start taps layout
                      SizedBox(
                        height: mediaHeight / 4,
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 2,
                          child: Scaffold(
                            backgroundColor: Colors.white,
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(mediaHeight),
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    TabBar(
                                        labelStyle: TextStyle(
                                            fontFamily: AppTheme.fontFamily),
                                        labelColor: AppTheme.primaryColor,
                                        indicatorColor: AppTheme.primaryColor,
                                        unselectedLabelColor: kMyGrey,
                                        isScrollable: true,
                                        tabs: [
                                          Tab(
                                            child: Text("الملاحظــات"),
                                          ),
                                          Tab(
                                            child: Text("المراجعــات"),
                                          ),
                                          Tab(
                                            child: Text("الوصــف"),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                            body: TabBarView(children: [
                              Text("moaid"),
                              Text("moaid"),
                              Text("moaid"),
                            ]),
                          ),
                        ),
                      ),
                      //end  taps layout

                       Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: BasicButtonsContainer(
                                  title: "إضافه الى السله",
                                  backgroundColor: AppTheme.primaryColor,
                                  textColor: Colors.white,
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(top: mediaHeight / 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: SvgPicture.asset(
                                              "${kIconsPath}up.svg"),
                                          onTap: () {
                                          },
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: SubTitleText(
                                          subTitle: '1'
                                              .toString(),
                                          color: AppTheme.primaryColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: SvgPicture.asset("${kIconsPath}down.svg"),
                                          onTap: (){
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  checkOrientation(BuildContext context) {
    setState(() {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.landscape) {
        mediaHeight = MediaQuery.of(context).size.width;
        mediaWidth = MediaQuery.of(context).size.height;
        _orientaion = "landscape";
      } else {
        mediaHeight = MediaQuery.of(context).size.height;
        mediaWidth = MediaQuery.of(context).size.width;
        _orientaion = "portrait";
      }
    });
  }
}
