import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/GempaTerkiniService.dart';
import 'package:flutter_application_1/user/model/GempaTerkiniModel.dart';
import 'package:google_fonts/google_fonts.dart';

class PageGempaTerkini extends StatefulWidget {
  const PageGempaTerkini({super.key});

  @override
  State<PageGempaTerkini> createState() => _PageGempaTerkiniState();
}

class _PageGempaTerkiniState extends State<PageGempaTerkini> {
  GempaTerkiniModel? gempaTerkini;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    gempaTerkini = await GempaTerkiniService().fetchGempaTerkini();
    setState(() {}); // Memperbarui UI setelah data diambil
  }

  @override
  Widget build(BuildContext context) {
    print("PageGempaTerkini loaded");
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFBD),
      appBar: AppBar(
        title: Text(
          'Gempa Terkini',
          style: GoogleFonts.arimo(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 60.0,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.redAccent[400],
      ),
      body: gempaTerkini == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gempaTerkini!.wilayah,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tanggal: ${gempaTerkini!.tanggal}, Jam: ${gempaTerkini!.jam}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Magnitudo: ${gempaTerkini!.magnitude}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Kedalaman: ${gempaTerkini!.kedalaman}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Potensi: ${gempaTerkini!.potensi}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Dirasakan: ${gempaTerkini!.dirasakan}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Image.network(
                            'https://data.bmkg.go.id/DataMKG/TEWS/${gempaTerkini!.shakemap}',
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
