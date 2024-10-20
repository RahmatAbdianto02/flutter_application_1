import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final String githubUrl = 'https://github.com/yourusername';
  final String linkedinUrl = 'https://www.linkedin.com/in/yourusername';
  final String instagramUrl = 'https://www.instagram.com/yourusername';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTop(),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    final double coverHeight = 280;
    final double profileHeight = 144;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profileHeight / 2),
          child: buildCoverImage(coverHeight),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(profileHeight),
        ),
      ],
    );
  }

  Widget buildCoverImage(double height) => Container(
        color: Colors.grey,
        child: Image.network(
          'https://plus.unsplash.com/premium_photo-1685086785636-2a1a0e5b591f?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage(double height) => CircleAvatar(
        radius: height / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/aboutme.jpg'),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'Rahmat Abdianto ',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Informatics engineering student',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.instagram),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'About Me\n\n“A student with steely determination and relentless spirit, continues to explore knowledge and explore the world of programming. Learning today to create a brighter future. 💻🌟 #FutureCoder #NeverStopLearning”',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(
                icon,
                size: 32,
              ),
            ),
          ),
        ),
      );
}
