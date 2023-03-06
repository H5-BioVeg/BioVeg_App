import 'package:bio_veg/widgets/GhPlant.dart';
import 'package:flutter/material.dart';

class GreenHouseScreen extends StatelessWidget {
  const GreenHouseScreen({super.key, this.houseName = "test"});

  final String houseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(houseName),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: const [
                  GhPlant(plantName: "Chili"),
                  SizedBox(height: 10),
                  GhPlant(plantName: "Tomat"),
                ]),
                Column(
                  children: const [
                    GhPlant(plantName: "Agurk"),
                    SizedBox(height: 10),
                    GhPlant(plantName: "Hvidløb"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
