import 'package:flutter_application_1/login%20page/login_page.dart';
import 'package:flutter_application_1/pageNews.dart';
import 'package:flutter_application_1/routes/app_routes_named.dart';
import 'package:flutter_application_1/settings/SettingPage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.RegisterPage, page: () => LoginPage()),
    GetPage(name: AppRoutesNamed.LoginPage, page: () => LoginPage()),
    GetPage(name: AppRoutesNamed.PageNews, page: () => SettingPage()),
    GetPage(name:AppRoutesNamed.SettingPage, page: () => SettingPage()),
   
  ];
}
