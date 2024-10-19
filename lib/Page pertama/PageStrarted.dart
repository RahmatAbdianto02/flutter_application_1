import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes_named.dart';
import 'package:google_fonts/google_fonts.dart';

class PageStarted extends StatelessWidget {
  const PageStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                width: double.infinity,
                height: 320,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/peringatan.png'))),
              ),
              Text(
                'TENTANG SULTENG',
                style: GoogleFonts.arimo(
                    fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                '\nDALAM GENGAMANMU',
                style: GoogleFonts.arimo(
                    fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman login
                    Navigator.pushNamed(context, AppRoutesNamed.LoginPage);
                  },
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.arimo(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff3498DB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              const SizedBox(height: 31),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman registrasi
                    // Navigator.pushNamed(context, AppRoutesNamed.RegisterPage);
                    Navigator.pushNamed(context, AppRoutesNamed.RegisterPage);
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.arimo(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 109, 21, 21)),
                      backgroundColor: Color.fromARGB(255, 198, 30, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
