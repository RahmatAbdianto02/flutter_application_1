import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pageNews.dart';
import 'package:flutter_application_1/service%20auth/auth_service.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Tambahkan controller untuk email dan password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/deal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Input Email dengan controller
                TextFormField(
                  controller:
                      emailController, // Masukkan controller untuk email
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffC0C0C0)),
                    ),
                    label: Text('Email'),
                  ),
                ),
                SizedBox(height: 40),
                // Input Password dengan controller
                TextFormField(
                  controller:
                      passwordController, // Masukkan controller untuk password
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffC0C0C0)),
                    ),
                    label: Text('Password'),
                  ),
                ),
                SizedBox(height: 10),
                // Lupa Password Text
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Implementasi tindakan lupa password
                    },
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Tombol Masuk
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passwordController.text;

                      try {
                        User? user =
                            await AuthService().signWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        if (user != null) {
                          Get.to(() => PageNews());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Gagal masuk. Periksa email dan password anda.')),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Teks "atau masuk menggunakan"
                Center(
                  child: Text(
                    'atau masuk menggunakan',
                    style: TextStyle(
                      color: Color(0xffC0C0C0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Tombol Google
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Implementasi login dengan Google
                      // Get.to(() => PageNews()); //
                      //
                      Get.toNamed('/page-dua');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/google icon 1.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Login dengan Google',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
