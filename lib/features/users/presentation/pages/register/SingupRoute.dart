import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/TapedText.dart';

import 'LoginRoute.dart';


class SignupRoute extends StatelessWidget {
  late String userName, email, phoneNumber, password, confirmPassword;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return ScreenStyle(
        title: "أنشاء حساب",
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            right: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
            left: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 9:ScreenUtil().height/9,
            top: ScreenUtil().orientation==Orientation.portrait?ScreenUtil().width / 17:ScreenUtil().height/17,

          ),
          child: Column(
            children: [
              Form(
                key: _signupFormKey,
                child: Column(
                  children: [
                    TextFormFieldContainer(
                      autofocus: true,
                      maxLength: 8,
                      hint: "أسم المستخدم",
                      icon_name: "user_square.svg",
                      textInputType: TextInputType.text,
                      onChange: (newValue) {
                        userName=newValue.trim();
                      },
                      validator: (value) {
                        if (value!.toString().isEmpty) {
                          return "يلزم تعبئه هذا الحقل";
                        }
                        return null;

                      },
                    ),
                    TextFormFieldContainer(
                      maxLength: 50,
                      hint: "الإيميل",
                      icon_name: "direct.svg",
                      textInputType: TextInputType.text,
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
                      hint: "رقم الهاتف",
                      maxLength: 12,
                      icon_name: "call.svg",
                      textInputType: TextInputType.text,
                      onChange: (newValue) {
                        phoneNumber=newValue.trim();

                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'الرجاء تعبئة الحقل';
                        }
                        if (value.toString().length < 9) {
                          return 'يجب أن يتكون رقم الهاتف من 9 أرقام';
                        }
                        if (!value.toString().startsWith(
                            new RegExp(r'[7][7|1|3|0]'))) {
                          return 'يجب أن يبدا رقم الهاتف ب 73 او 70 او 71 او 77 ';
                        }
                        return null;

                      },
                    ),
                    TextFormFieldContainer(
                      maxLength: 10,
                      hint: "كلمة المرور",
                      icon_name: "key_square.svg",
                      textInputType: TextInputType.text,
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
                    TextFormFieldContainer(
                      maxLength: 10,
                      hint: "تأكيد كلمة المرور",
                      icon_name: "key_square.svg",
                      textInputType: TextInputType.text,
                      onChange: (newValue) {
                        confirmPassword=newValue.trim();

                      },
                      validator: (value) {
                        if (value!.toString().isEmpty) {
                          return "يلزم تعبئه هذا الحقل";
                        }
                        if (value!=password) {
                          return "كلمات المرور غير متطابقه";
                        }
                        return null;

                      },
                    ),
                  ],
                ),
              ),
              BasicButtonsContainer(
                  title: "إشتراك",
                  backgroundColor: AppTheme.primaryColor,
                  textColor: Colors.white,
                  onTap: () {
                    if (_signupFormKey.currentState!.validate()) {
                      print('success');
                    } else {
                      print('error');
                    }
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TapedText(
                    text: "تسجيل الدخول",
                    color: AppTheme.primaryColor,
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginRoute();
                      }));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("هل لديك حساب بالفعل ؟"),
                ],
              )
            ],
          ),
        ));
  }


}
