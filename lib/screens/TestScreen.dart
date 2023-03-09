import 'package:bio_veg/arduino_connector.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
   TestScreen({super.key, this.title = "Bioveg"});
  final String title;

  final ArduinoConnector conn =  ArduinoConnector();
  
  @override
  State<TestScreen> createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontSize: 30),
        )),
      ),
      body: Center(
            child: Text(
              widget.conn.scanForGreenHouses(),
            )
      ),
    );
  }
}
