import 'package:flutter/material.dart';

class Pagenews extends StatelessWidget {
  const Pagenews({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newsData = [
      {
        'image': 'assets/NewsImage.png',
        'category': 'TECHNOLOGY',
        'title': 'Insurtech startup PasarPolis gets \$54 million - Series B',
      },
      {
        'image': 'assets/NewsImage2.png',
        'category': 'TECHNOLOGY',
        'title': 'The IPO parade continues as Wish files, Bumble',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('NewsApp',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Swipe News.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lastest News',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Satu kolom
                  crossAxisSpacing: 10.0, // Jarak antar kolom
                  mainAxisSpacing: 10.0, // Jarak antar baris
                  childAspectRatio:
                      3, // Rasio aspek untuk membuat item lebih lebar
                ),
                itemCount: newsData.length, // Jumlah item
                itemBuilder: (context, index) {
                  final item = newsData[index];
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item['image']!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['category']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
