import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class VerifyCode extends StatelessWidget {
  late String email;
  final _restorePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    ScreenUtil().init(context);
    return ScreenStyle(
      title: "Verify Code",
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            right: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
            left: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
            top: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 4:ScreenUtil().height/4,

          ),
          child: Padding(
            //
            padding: const EdgeInsets.all(8.0),
            child:Column(
              children: [
                SubTitleText(
                  subTitle:
                  "قم بادخال الكود الذي ارسل اليك عبر الايميل الذي فمت بإدخاله",
                  fontSize: 20,
                  color: kMyGrey,

                ),

                Form(
                  key: _restorePasswordFormKey,
                  child: TextFormFieldContainer(
                    autofocus: true,
                    maxLength: 50,
                    hint: "الكود",
                    icon_name: "direct.svg",
                    onChange: (newValue) {
                      email=newValue.trim();
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'يجب ادخال الكود';
                      }
                      return null;
                    },
                  ),
                ),

                BasicButtonsContainer(
                    title: "التحقق",
                    backgroundColor: AppTheme.primaryColor,
                    textColor: Colors.white,
                    onTap: () {
                      if (_restorePasswordFormKey.currentState!.validate()) {
                        print('ok');
                      } else {
                        print('error');
                      }
                    }),
              ],
            ),
          )
      ),
    );
  }

}


