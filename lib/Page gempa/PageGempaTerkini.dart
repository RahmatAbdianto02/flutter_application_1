import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/gempa_terkini_controller.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class PageGempaTerkini extends StatelessWidget {
  final GempaTerkiniController controller = Get.put(GempaTerkiniController());

  @override
  Widget build(BuildContext context) {
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final gempaTerkini = controller.gempaTerkini.value;
          return Padding(
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
                          gempaTerkini.wilayah,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Tanggal: ${gempaTerkini.tanggal}, Jam: ${gempaTerkini.jam}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Magnitudo: ${gempaTerkini.magnitude}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Kedalaman: ${gempaTerkini.kedalaman}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Potensi: ${gempaTerkini.potensi}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Dirasakan: ${gempaTerkini.dirasakan}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Image.network(
                          'https://data.bmkg.go.id/DataMKG/TEWS/${gempaTerkini.shakemap}',
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
