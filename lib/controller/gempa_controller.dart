import 'package:get/get.dart';
import 'package:flutter_application_1/Service/gempa_service.dart';
import 'package:flutter_application_1/user/model/user_model.dart';

class GempaController extends GetxController {
  var gempaList = <UserModel>[].obs;  // Observable list
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchGempaData();
    super.onInit();
  }

  void fetchGempaData() async {
    try {
      isLoading(true);
      var data = await GempaService().fetchGempa();
      if (data.isNotEmpty) {
        gempaList.assignAll(data);
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
