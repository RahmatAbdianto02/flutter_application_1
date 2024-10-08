import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/model/user_model.dart';
import 'package:flutter_application_1/user/page/detail_user_page.dart';
import 'package:flutter_application_1/user/service/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> users = [];

  // merupakan method pertama kali dijalankan
  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
  }

  getData() async {
    users = await UserService().fetchUser();
    print("ini data users ${users.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailUserPage(
                  userId: users[index].id,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('${users[index].firstName} ${users[index].lastName}'),
              leading: Image.network(users[index].avatar),
              subtitle: Text(users[index].email),
            ),
          ),
        ),
      ),
    );
  }
}
