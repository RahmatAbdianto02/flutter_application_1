import 'package:dio/dio.dart';
import 'package:flutter_application_1/user/model/GempaTerkiniModel.dart';



class GempaTerkiniService {
  Dio dio = Dio();
  static const url = 'https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json';

  Future<GempaTerkiniModel?> fetchGempaTerkini() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // Mengakses data gempa dari JSON
        final gempaData = response.data['Infogempa']['gempa'];
        
        // Pastikan gempaData adalah Map dan tidak null
        if (gempaData != null && gempaData is Map<String, dynamic>) {
          return GempaTerkiniModel.fromJson(gempaData);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    return null; // Kembalikan null jika tidak ada data
  }
}
