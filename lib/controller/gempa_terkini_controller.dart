import 'package:get/get.dart';
import 'package:flutter_application_1/Service/GempaTerkiniService.dart';
import 'package:flutter_application_1/user/model/GempaTerkiniModel.dart';

class GempaTerkiniController extends GetxController {
  var gempaTerkini = GempaTerkiniModel(
    tanggal: '',
    jam: '',
    dateTime: '',
    coordinates: '',
    lintang: '',
    bujur: '',
    magnitude: '',
    kedalaman: '',
    wilayah: '',
    potensi: '',
    dirasakan: '',
    shakemap: '',
  ).obs;  
  
  var isLoading = true.obs;  

  @override
  void onInit() {
    super.onInit();
    fetchGempaTerkini();  
  }

  void fetchGempaTerkini() async {
    isLoading(true);
    try {
      final data = await GempaTerkiniService().fetchGempaTerkini();
      if (data != null) {
        gempaTerkini.value = data;  
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
