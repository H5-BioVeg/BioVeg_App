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
        title: Text(style: TextStyle(fontSize: 30), houseName),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: (() {
                //Go to settings
              })),
        ],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                //Header row with degrees and humidity
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.wb_sunny, color: Colors.amberAccent),
                      Text(style: TextStyle(fontSize: 20), "26*C"),
                      SizedBox(width: 60),
                      Icon(Icons.water_drop_outlined, color: Colors.blueAccent),
                      Text(style: TextStyle(fontSize: 20), "80%"),
                    ],
                  ),
                ),
                //Row for all the plants
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: const [
                      GhPlant(plantName: "Chili"),
                      SizedBox(height: 10),
                      GhPlant(plantName: "Tomat"),
                      SizedBox(height: 10),
                      GhPlant(plantName: "Oregano"),
                      SizedBox(height: 10),
                      GhPlant(plantName: "Iceberg salat"),
                    ]),
                    Column(
                      children: const [
                        GhPlant(plantName: "Agurk"),
                        SizedBox(height: 10),
                        GhPlant(plantName: "Hvidløg"),
                        SizedBox(height: 10),
                        GhPlant(plantName: "Peperfrugt"),
                        SizedBox(height: 10),
                        GhPlant(plantName: "Basilikum"),
                      ],
                    ),
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
