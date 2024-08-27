import 'package:flutter/material.dart';

import '../view_models/auth_view_model.dart';
import '../views/auth/login_otp_view.dart';
import '../views/auth/login_password_view.dart';
import '../views/auth/verify_mobile_view.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/onboarding_screen.dart/onboarding_view.dart';
import '../views/screens/bottom_bar.dart';
import '../views/screens/category_page.dart';
import '../views/screens/language_view.dart';
import '../views/screens/shop_page.dart';
import '../views/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.splashRoute: (context) => SplashView(),
    //VideoSplashView(),
    Routes.languageRoute: (context) => const LanguageView(),
    Routes.onboardingRoute: (context) => const OnboardingView(),
    Routes.loginPasswordRoute: (context) => const LoginPasswordView(),
    Routes.signUpRoute: (context) => const SignUpView(),
    Routes.verifyMobileViewRoute: (context) => const VerifyMobileView(),
    Routes.loginOtpRoute: (context) => const LoginOtpView(),
    Routes.bottomBarRoute: (context) => const BottomBarView(),
    Routes.categoryRoute: (context) => const CategoryPage(),
    Routes.shopRoute: (context) => const ShopPage(),
    Routes.googleMapRoute: (context) => const GoogleMapScreen(),
  };
}
