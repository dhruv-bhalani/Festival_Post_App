import 'package:festival_post_maker/views/detail_page/detail_page.dart';
import 'package:festival_post_maker/views/editpage/editpage.dart';
import 'package:festival_post_maker/views/home_page/home_page.dart';
import 'package:festival_post_maker/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static String editPage = 'edit_page';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';
  static String splashScreen = '/';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.splashScreen: (context) => SplashScreen(),
  Routes.homePage: (context) => const HomePage(),
  Routes.detailPage: (context) => const DetailPage(),
  Routes.editPage: (context) => const Editpage(),
};
