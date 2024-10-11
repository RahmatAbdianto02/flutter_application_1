import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/login%20page/login_page.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  // Inisialisasi FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Controller untuk mengambil nilai dari TextFormField
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 352,
                height: 330,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image_news_app.png'))),
              ),
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: "Masukan Email",
              controller: emailController,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: "Password",
              controller: passwordController,
              isObscured: true, // Menyembunyikan password
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: "Confirm Password",
              controller: confirmPasswordController,
              isObscured: true, // Menyembunyikan password
            ),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Color(0xff3498Db)),
                onPressed: () async {
                  // Proses registrasi
                  if (passwordController.text == confirmPasswordController.text) {
                    User? user = await createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                    );
                    if (user != null) {
                      // Registrasi berhasil, lanjutkan ke halaman berikutnya
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage())); // Ganti dengan halaman yang sesuai
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password tidak cocok')),
                    );
                  }
                },
                child: Text('Mendaftar', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Atau daftar menggunakan',
                  style: TextStyle(color: Color(0xffC0C0C0)),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    // Tambahkan logika untuk login dengan Google di sini
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google icon 1.png'))),
                      ),
                      Text('Google', style: TextStyle(color: Colors.red)),
                      SizedBox()
                    ],
                  )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('Sudah punya akun? silahkan '),
                Text(
                  'Masuk',
                  style: TextStyle(color: Color(0xff3498Db)),
                ),
                
              ],
            )
          ],
        ),
      )),
    );
  }

  // Fungsi untuk membuat pengguna baru
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Password is too weak')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The account already exists for that email')),
        );
      }
      return null; // Return null if there's an error
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.isObscured = false,
  });

  final String label;
  final TextEditingController controller;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isObscured,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)),
        ),
      ),
    );
  }
}
