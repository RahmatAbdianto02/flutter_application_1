import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/model/user_model.dart';
import 'package:flutter_application_1/user/service/user_service.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key, required this.userId});

  final int userId; // Tambahkan ini agar userId bisa diakses

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  UserModel? user;
  bool isLoading = true; // Mulai dalam keadaan loading

  @override
  void initState() {
    super.initState();
    UserService().fetchDetailUser(widget.userId).then((fetchedUser) {
      setState(() {
        user = fetchedUser;
        isLoading = false;
      });
    }).catchError((e) {
      // Handle error jika diperlukan
      setState(() {
        isLoading = false; // Pastikan loading dihentikan
      });
      print('Error fetching user details: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : user == null
                ? const Center(child: Text('User not found'))
                : ListTile(
                    title: Text('${user?.firstName} ${user?.lastName}'),
                    leading: Image.network(user?.avatar ?? ''),
                    subtitle: Text(user?.email ?? ''),
                  ),
      ),
    );
  }
}
