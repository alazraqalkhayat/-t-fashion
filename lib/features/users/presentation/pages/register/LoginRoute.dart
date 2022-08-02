import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';
import 'package:t_fashion/core/widgets/texts/TapedText.dart';
import 'package:t_fashion/features/users/presentation/pages/forgetPassword/ResstorePassword.dart';

import 'SingupRoute.dart';


class LoginRoute extends StatelessWidget {
  late SharedPreferences preferences;
  late String email, password;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return ScreenStyle(
      title: "تسجيل الدخول",
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          right: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
          left: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
          top: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 10:ScreenUtil().height/10,

        ),
        child: Column(
          children: [
            SubTitleText(
              subTitle:
                  "للتمكن من شراء المنتجات الرجاء تسجيل الدخول ببيانات حقيقيه ",
              fontSize: 20,
              color: kMyGrey,
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  TextFormFieldContainer(
                    autofocus: true,
                    maxLength: 50,
                    hint: "الايميل",
                    icon_name: "direct.svg",
                    onChange: (newValue) {
                      email=newValue.trim();
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'يجب ادخال عنوان البريد الالكتروني';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString())) {
                        return "عذراً الإيميل الذي ادخلته غير صحيح";
                      }
                      return null;
                    },
                  ),
                  TextFormFieldContainer(
                    obscureText: true,
                    hint: "كلمة المرور",
                    maxLength: 10,
                    icon_name: "key_square.svg",
                    textInputType: TextInputType.visiblePassword,
                    onChange: (newValue) {
                      password=newValue.trim();
                    },
                    validator: (value) {

                      if (value!.toString().isEmpty) {
                        return "يلزم تعبئه هذا الحقل";
                      }

                      return null;
                    },
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Row(
                  children: [
                    SubTitleText(
                      subTitle: "تذكرني",
                      fontSize: 15,
                      color: kMyGrey,
                    ),
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                        value: true,
                        onChanged: (newValue) {}),
                  ],
                ),
                TapedText(
                  text: "نسيت كلمة المرور",
                  color: AppTheme.primaryColor,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RestorePassword();
                    }));
                  },
                ),
              ],
            ),
            BasicButtonsContainer(
                title: "دخول",
                backgroundColor: AppTheme.primaryColor,
                textColor: Colors.white,
                onTap: () {
                  if (_loginFormKey.currentState!.validate()) {
                    print('ok');

                  } else {
                    print('error');
                  }

                }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TapedText(
                  text: "إنشاء حساب",
                  color: AppTheme.primaryColor,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return SignupRoute();
                    }));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("لايوجد لديك حساب ؟"),
              ],
            )
          ],
        ),
      ),
    );
  }


  saveDate(String userName) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("userNAme", userName);
  }
}
