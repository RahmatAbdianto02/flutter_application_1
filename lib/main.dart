import 'package:flutter/material.dart';
import 'package:flutter_application_1/login%20page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/register%20page/register_page.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes,
        theme: ThemeData(
            // scaffoldBackgroundColor: Color(0xFFA5B68D),
            ),
        // home: const GetStartedPage(),
        // home: GetStartedPage(),
       );
  }
}

// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter Page'),
//         backgroundColor: Color.fromARGB(255, 176, 154, 81),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () {
//                 counter--;
//                 setState(() {});
//               },
//               child: const Icon(
//                 Icons.remove,
//                 color: Colors.red,
//                 size: 40,
//               ),
//             ),
//             const SizedBox(width: 20),
//             Text('Nilai Counter : $counter'),
//             const SizedBox(width: 20),
//             InkWell(
//               onTap: () {
//                 counter++;
//                 setState(() {});
//               },
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.blue,
//                 size: 40,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /*

// Analisis terhadap SETSTATE

// APA KEGUNAAN  DARI SETSTATE YANG MEMPENGARUHI WIDGET

// JAWAB : 
// Kegunaan utama setState adalah untuk memperbarui UI ketika ada perubahan pada data (state) di dalam widget. Dengan memanggil setState, Flutter diberi tahu untuk membangun ulang (rebuild) widget yang bersangkutan, sehingga perubahan state tersebut dapat terlihat di layar.


// */
