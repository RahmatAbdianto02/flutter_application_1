


import 'package:flutter_application_1/Bottom%20nav/HomePage.dart';
import 'package:flutter_application_1/Page%20gempa/page_gempa.dart';
import 'package:flutter_application_1/Page%20pertama/PageStrarted.dart';
import 'package:flutter_application_1/login%20page/login_page.dart';
import 'package:flutter_application_1/register%20page/register_page.dart';
import 'package:flutter_application_1/routes/app_routes_named.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.PageStarted, page: ()=> PageStarted()),
    GetPage(name: AppRoutesNamed.RegisterPage, page: () => RegisterPage()),
    GetPage(name: AppRoutesNamed.LoginPage, page: () => LoginPage()),
    GetPage(name: AppRoutesNamed.PageGempa, page: () => PageGempa()),
    GetPage(name: AppRoutesNamed.HomePage, page: ()=> HomePage())
  ];
}

// class AppRoutes {
//   static final routes = [
//     GetPage(name: AppRoutesNamed.RegisterPage, page: () => RegisterPage()),
//     GetPage(name: AppRoutesNamed.LoginPage, page: () => LoginPage()),
//     // GetPage(name: AppRoutesNamed.HomePage, page: () => HomePage()),
//       // GetPage(name: AppRoutesNamed.HomePage, page: () => HomePage()),
//       GetPage(name: AppRoutesNamed.PageGempa, page: ()=> PageGempa())
     
//     // GetPage(name:AppRoutesNamed.SettingPage, page: () => SettingPage()),
//   ];
// }

// class AppRoutes {
//   static final routes = [
//     GetPage(name: AppRoutesNamed.RegisterPage, page: () => LoginPage()),
//     GetPage(name: AppRoutesNamed.LoginPage, page: () => LoginPage()),
//     GetPage(name: AppRoutesNamed.HomePage, page: () => HomePage()),
//     // Uncomment if needed
//     // GetPage(name: AppRoutesNamed.SettingPage, page: () => SettingPage()),
//   ];
// }
