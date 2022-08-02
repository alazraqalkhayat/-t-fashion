import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class ConfirmPassword extends StatelessWidget {
  late String password, confirmPassword;
  final _confirmPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return ScreenStyle(
      title: "تعيين كلمة المرور",
      child: Form(
          key: _confirmPasswordFormKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              right: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
              left: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
              top: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 6:ScreenUtil().height/6,

            ),
            child: Column(
              children: [
                SubTitleText(
                  subTitle: "قم بإدخال كلمة المرور الجديده",
                  fontSize: 20,
                  color: kMyGrey,
                ),
                TextFormFieldContainer(
                  autofocus: true,
                  obscureText: true,
                  hint: "كلمة المرور",
                  maxLength: 10,
                  icon_name: "key_square.svg",
                  textInputType: TextInputType.text,
                  onChange: (newValue) {
                    password = newValue.trim();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "يلزم تعبئه هذا الحقل";
                    }
                    return null;
                  },
                ),
                TextFormFieldContainer(
                  hint: "تأكيد كلمة المرور",
                  obscureText: true,
                  maxLength: 30,
                  icon_name: "key_square.svg",
                  textInputType: TextInputType.text,
                  onChange: (newValue) {
                    confirmPassword = newValue.trim();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "يلزم تعبئه هذا الحقل";
                    }
                    if (value != password) {
                      return "كلمات المرور غير متطابقه";
                    }
                    return null;
                  },
                ),
                BasicButtonsContainer(
                    title: "حفظ",
                    backgroundColor: AppTheme.primaryColor,
                    textColor: Colors.white,
                    onTap: () {
                      if (_confirmPasswordFormKey.currentState!.validate()) {
                        print('ok');

                      } else {
                        print('error');
                      }
                    }),
              ],
            ),
          )),
    );
  }

}
