import 'package:flutter/material.dart';
// Pages
import '/pages/home.dart';
// Widgets
import '/widgets/my_bottom_bar.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Home(),
              Home(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        items: const [
          (page: 0, icon: Icons.home, text: "Home"),
          (page: 1, icon: Icons.person, text: "About me"),
          (page: 2, icon: Icons.code, text: "Projects"),
          (page: 3, icon: Icons.email, text: "Contact"),
        ],
        indexSelected: 0,
        onTap: (index) {},
      ),
    );
  }
}
