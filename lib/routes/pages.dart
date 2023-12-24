import 'package:get/get.dart';
import 'package:wasil_user/routes/routes.dart';
import 'package:wasil_user/screens/auth/signin/signin_screen.dart';
import 'package:wasil_user/screens/home/home_page_screen.dart';

import '../screens/splash/splash_screen.dart';

final pages = <GetPage>[
  GetPage(name: AppRoutes.homescreen, page: () => const Home_Page_Screen()),
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.signinscreen,
    page: () => const Signin_Screen(),
  ),
];
