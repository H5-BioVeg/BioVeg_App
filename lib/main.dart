import 'package:flutter/material.dart';
import 'package:bio_veg/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(const FrontPage());
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bioveg",
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.lightBlue,
      ),
      home: const HomeScreen(title: 'Bioveg'),
    );
  }
}
