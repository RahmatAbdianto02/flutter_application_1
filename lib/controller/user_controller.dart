import 'package:flutter_application_1/user/model/user_model.dart';
import 'package:flutter_application_1/user/service/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <UserModel>[].obs; // Reactive list of UserModel

  @override
  void onInit() {
    super.onInit();
    fetchDataUser(); //
  }

  Future<void> fetchDataUser() async {
    try {
      var fetchedUsers = await UserService().fetchUser();
      users.assignAll(fetchedUsers); // Store fetched users in the users list
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  Future<UserModel?> fetchDetailUser(int id) async {
    try {
      return await UserService().fetchDetailUser(id);
    } catch (e) {
      print('Error fetching user detail: $e');
      return null; // Return null on error
    }
  }
}
