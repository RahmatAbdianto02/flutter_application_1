import 'package:dio/dio.dart';
import 'package:flutter_application_1/user/model/user_model.dart';


class GempaService {
  Dio dio = Dio();
  static const url = 'https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json';

  Future<List<UserModel>> fetchGempa() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // Mengakses data gempa dari JSON
        final List<dynamic> data = response.data['Infogempa']['gempa'];
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
