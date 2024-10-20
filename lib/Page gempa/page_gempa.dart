import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/gempa_controller.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class PageGempa extends StatelessWidget {
  final GempaController controller = Get.put(GempaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFBD),
      appBar: AppBar(
        title: Text(
          'Data Gempa',
          style: GoogleFonts.arimo(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
        backgroundColor: const Color.fromARGB(255, 225, 232, 21),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.gempaList.isEmpty) {
          return const Center(child: Text('No data available.'));
        } else {
          return ListView.builder(
            itemCount: controller.gempaList.length,
            itemBuilder: (context, index) {
              final item = controller.gempaList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.wilayah,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            const SizedBox(width: 8),
                            Text(
                              'Koordinat: ${item.coordinates}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.speed, color: Colors.orange),
                            const SizedBox(width: 8),
                            Text(
                              'Magnitudo: ${item.magnitude}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.water, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text(
                              'Kedalaman: ${item.kedalaman}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text(
                              'Tanggal: ${item.tanggal}, Jam: ${item.jam}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Potensi: ${item.potensi}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
