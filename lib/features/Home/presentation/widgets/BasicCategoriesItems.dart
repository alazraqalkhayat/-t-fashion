import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';


class BasicCategoriesItems extends StatelessWidget {


  late String title;
  late Function onTap;
  late double mediaHeight,mediaWidth;


  BasicCategoriesItems({required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {

    checkOrientation(context);

    return Container(
      margin: EdgeInsets.only(bottom: mediaHeight/40),
      child: GestureDetector(

        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.all(Radius.circular(20),),
          child: Container(
            height: mediaHeight / 5,
            width: double.infinity,
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
                    height: mediaHeight,
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
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "${kImagesPath}gallery1.png",

                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubTitleText(subTitle: title, fontSize: 20,color: kMyGrey,),

                    ],
                  ),
                )
              ],
            ),

          ),
        ),

        onTap: (){
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
