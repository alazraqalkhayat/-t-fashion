import 'package:flutter/material.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/util/ScreenUtil.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class RestorePassword extends StatelessWidget {
  late String email;
  final _restorePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    ScreenUtil().init(context);
    return ScreenStyle(
      title: "إستعاده كلمة المرور",
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
                    "قم بإدخال بريدك الإلكتروني لإستعاده كلمه المرور الخاصه بك وإعاده تعيينها",
                    fontSize: 20,
                    color: kMyGrey,

                  ),

                   Form(
                     key: _restorePasswordFormKey,
                     child: TextFormFieldContainer(
                            autofocus: true,
                            maxLength: 50,
                            hint: "الإيميل",
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
                   ),

                   BasicButtonsContainer(
                          title: "إستعاده",
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


