import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom%20nav/HomePage.dart';
import 'package:flutter_application_1/Page%20pertama/PageStrarted.dart';
import 'package:flutter_application_1/login%20page/login_page.dart';
import 'package:flutter_application_1/routes/app_routes_named.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
// Impor HomePage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Saya',
      initialRoute: AppRoutesNamed.PageStarted, // Tentukan halaman awal
      getPages: [
        GetPage(
          name: AppRoutesNamed.LoginPage,
          page: () => LoginPage(),
        ),
        GetPage(
          name: AppRoutesNamed.HomePage,
          page: () => HomePage(), 
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageStarted(), 
    );
  }
}
