// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/controller/user_controller.dart';
// import 'package:flutter_application_1/user/page/detail_user_page.dart';
// import 'package:get/get.dart';

// class UserPage extends StatelessWidget {
//   const UserPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final UserController userController =
//         Get.put(UserController()); // Inisialisasi controller

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Page'),
//       ),
//       body: Obx(() {
//         if (userController.users.isEmpty) {
//           return const Center(child: Text('No users available.'));
//         }

//         return ListView.builder(
//           itemCount: userController.users.length,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               Get.to(
//                   () => DetailUserPage(userId: userController.users[index].id));
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 title: Text(
//                     '${userController.users[index].firstName} ${userController.users[index].lastName}'),
//                 leading: Image.network(userController.users[index].avatar),
//                 subtitle: Text(userController.users[index].email),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }


// // class UserPage extends StatefulWidget {
// //   const UserPage({super.key});

// //   @override
// //   State<UserPage> createState() => _UserPageState();
// // }

// // class _UserPageState extends State<UserPage> {
// //   List<UserModel> users = [];

// //   // merupakan method pertama kali dijalankan
// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //     setState(() {});
// //   }

// //   getData() async {
// //     users = await UserService().fetchUser();
// //     print("ini data users ${users.length}");
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('User Page'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: users.length,
// //         itemBuilder: (context, index) => InkWell(
// //           onTap: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => DetailUserPage(
// //                   userId: users[index].id,
// //                 ),
// //               ),
// //             );
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: ListTile(
// //               title: Text('${users[index].firstName} ${users[index].lastName}'),
// //               leading: Image.network(users[index].avatar),
// //               subtitle: Text(users[index].email),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
