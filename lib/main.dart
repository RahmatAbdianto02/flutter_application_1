import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFA66E38),
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
        backgroundColor: Color.fromARGB(255, 176, 154, 81),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                counter--;
                setState(() {});
              },
              child: const Icon(
                Icons.remove,
                color: Colors.red,
                size: 40,
              ),
            ),
            const SizedBox(width: 20),
            Text('Nilai Counter : $counter'),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                counter++;
                setState(() {});
              },
              child: const Icon(
                Icons.add,
                color: Colors.blue,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*

Analisis terhadap SETSTATE

APA KEGUNAAN  DARI SETSTATE YANG MEMPENGARUHI WIDGET

JAWAB : 
Kegunaan utama setState adalah untuk memperbarui UI ketika ada perubahan pada data (state) di dalam widget. Dengan memanggil setState, Flutter diberi tahu untuk membangun ulang (rebuild) widget yang bersangkutan, sehingga perubahan state tersebut dapat terlihat di layar.


*/
