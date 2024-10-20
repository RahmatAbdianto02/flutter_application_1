import 'package:flutter/material.dart';
import 'package:flutter_application_1/About%20Page/AboutMe.dart';
import 'package:flutter_application_1/Page%20gempa/PageGempaTerkini.dart';
import 'package:flutter_application_1/Page%20gempa/page_gempa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indeks halaman saat ini
  final List<Widget> _pages = [
    PageGempa(), // Halaman pertama
    PageGempaTerkini(), // Halaman kedua
    const AboutMe(), // Halaman ketiga
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Mengubah halaman sesuai dengan item yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/gempa1.png',
                width: 24, height: 24), // Gambar untuk Data Gempa
            label: 'Data Gempa',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/gempa2.png',
                width: 24, height: 24), // Gambar untuk Gempa Terkini
            label: 'Gempa Terkini',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/user.png',
                width: 24, height: 24), // Gambar untuk About Me
            label: 'About Me',
          ),
        ],
        currentIndex: _currentIndex, // Menandai item yang dipilih
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Memanggil fungsi saat item di-tap
      ),
    );
  }
}
