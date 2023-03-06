import 'package:flutter/material.dart';
import 'package:bio_veg/screens/HomeScreen.dart';

void main() {
  runApp(const FrontPage());
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bioveg",
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.lightBlue,
      ),
      home: const HomeScreen(title: 'Bioveg'),
    );
  }
}
