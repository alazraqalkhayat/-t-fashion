// @dart=2.9

import 'package:flutter/material.dart';
import 'core/others/Constants.dart';
import 'features/AddLocation/presentation/pages/AddLocation.dart';
import 'features/Favorite/presentation/pages/FavoriteRoute.dart';
import 'features/Home/presentation/pages/HomeRoute.dart';
import 'features/Invoice/presentation/pages/InvoiceRoute.dart';
import 'features/Offers/presentation/pages/OffersRoute.dart';
import 'features/ProductDetails/presentation/pages/ProductDetails.dart';
import 'features/SavedLocations/presentation/pages/SavedLocationRoute.dart';
import 'features/Settings/presentation/pages/SettingsRoute.dart';
import 'features/Splash/BasicSplashRoute.dart';
import 'features/cart/presentation/pages/CartRoute.dart';
import 'features/users/presentation/pages/forgetPassword/ConfirmPasseord.dart';
import 'features/users/presentation/pages/forgetPassword/ResstorePassword.dart';
import 'features/users/presentation/pages/register/LoginRoute.dart';
import 'features/users/presentation/pages/register/SingupRoute.dart';
import 'package:t_fashion/injection_container.dart' as dl;

void main() async{
  await dl.init();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hawkah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: kSplashRoute,

      routes:{
        kHomeRoute:(context)=>HomeRoute(),
        kLoginRoute:(context)=>LoginRoute(),
        kSignupRoute:(context)=>SignupRoute(),
        kRestorePassword:(context)=>RestorePassword(),
        kConfirmPassword:(context)=>ConfirmPassword(),
        kSettings:(context)=>SettingsRoute(),
        kFavoriteRoute:(context)=>FavoriteRoute(),
        kCartRoute:(context)=>CartRoute(),
        kOffersRoute:(context)=>OffersRoute(),
        kSplashRoute:(context)=>BasicSplashRoute(),
        kProductDetailsRoute:(context)=>ProductDetails(),
        kSavedLocationRoute:(context)=>SavedLocationRoute(),
        kInvoiceRoute:(context)=>InvoiceRoute(),
        kAddLocationRoute:(context)=>AddLocation(),

      },
    );
  }
}

