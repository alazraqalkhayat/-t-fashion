import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_fashion/core/app_theme.dart';

import '../others/Constants.dart';

class TextFormFieldContainer extends StatelessWidget {
  var onChange = (newValue) {};
  var validator = (String ? newValue) {
    return newValue;
  };
  late String hint,icon_name;
  late bool autofocus ;
  TextInputType textInputType;
  late bool obscureText,enable;
  late int maxLength;


  late double mediaHeight,mediaWidth;



  TextFormFieldContainer({required this.hint,required this.icon_name,this.textInputType=TextInputType.text,required this.onChange,required this.validator,this.autofocus=false,this.obscureText=false,required this.maxLength,this.enable=true});

  late String _orientation;
  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: mediaHeight/10,
      child: TextFormField(
        enabled: enable,

        style: TextStyle(color: AppTheme.primaryColor),
        keyboardType:textInputType,
        validator: validator,
        textDirection: TextDirection.rtl,
        autofocus: autofocus,
        obscureText: obscureText,
          inputFormatters:[
            LengthLimitingTextInputFormatter(10),
          ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(color: AppTheme.primaryColor,style: BorderStyle.solid,width: 1 )
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(color: AppTheme.primaryColor,style: BorderStyle.solid,width: 1 )
          ),
          contentPadding: _orientation=="landSpace"?EdgeInsets.only(top:-4):EdgeInsets.only(top: -10),
          suffixIcon: SvgPicture.asset("${kIconsPath}$icon_name",fit: BoxFit.scaleDown,),
          hintText: hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: kTextFormFiledHintColor,),

        ),

        onChanged: onChange,
      ),
    );
  }

  checkOrientation(BuildContext context){
    Orientation orientation=MediaQuery.of(context).orientation;

    if(orientation==Orientation.landscape){
      _orientation="landSpace";
      mediaHeight = MediaQuery.of(context).size.width;
      mediaWidth = MediaQuery.of(context).size.height;
    }else{
      _orientation="portrait";
      mediaHeight = MediaQuery.of(context).size.height;
      mediaWidth = MediaQuery.of(context).size.width;
    }
  }

}


