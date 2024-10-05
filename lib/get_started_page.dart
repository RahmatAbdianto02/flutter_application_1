import 'package:flutter/material.dart';
import 'package:flutter_application_1/pageNews.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 86),
                width: double.infinity,
                height: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gambar.png'),
                  ),
                ),
              ),
              SizedBox(height: 21),
              Text(
                'Yuk, Membaca Bersama\n Sanber News',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 21),
              Text(
                'Berita Terpercaya, Di Ujung Jari Anda',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke PageNews
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ),
                    );
                  },
                  child: Text('Masuk'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 24, 28, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 21),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika sesuai kebutuhan di sini
                  },
                  child: Text('Mendaftar'),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 24, 28, 240),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
