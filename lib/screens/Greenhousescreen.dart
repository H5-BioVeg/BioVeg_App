import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/screens/GreenHouseSettingsScreen.dart';
import 'package:bio_veg/widgets/GhPlant.dart';
import 'package:flutter/material.dart';

class GreenHouseScreen extends StatefulWidget {
  GreenHouseScreen(
      {super.key, required this.currentHouse, required this.manager});

  late Greenhouse currentHouse;
  late final GreenhouseManager manager;

  @override
  State<GreenHouseScreen> createState() => _GreenHouseScreenState();
}

class _GreenHouseScreenState extends State<GreenHouseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            style: const TextStyle(fontSize: 30), widget.currentHouse.name),
        actions: [
          //Go to settings button
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: (() async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: const RouteSettings(name: "ghSettings"),
                      builder: (context) => GreenHouseSettingsScreen(
                            house: widget.currentHouse,
                          )));
              if (!mounted) {
                return;
              }
              //Has a setstate to save the new changes in the app afte returning from settings, whilst also saving it to db.
              if (result != null) {
                setState(() {
                  widget.currentHouse = result as Greenhouse;
                  widget.manager.updateGreenHouse(widget.currentHouse, 
                  ModalRoute.of(context)!.settings.name.toString());
                });
              }
            }),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              //Header row with degrees and humidity
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                //Row showing temperature and humidity in the greenhouse
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_sunny, color: Colors.amberAccent),
                    Text(
                        style: const TextStyle(fontSize: 20),
                        "${widget.currentHouse.temperature}°C"),
                    const SizedBox(width: 60),
                    const Icon(Icons.water_drop, color: Colors.blueAccent),
                    Text(
                        style: const TextStyle(fontSize: 20),
                        "${widget.currentHouse.humidity}%"),
                  ],
                ),
              ),
              //Row for all the plants
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //creates a collective list using the spread operator (...)
                  //We have 2 columns of plants and we take every other plant so we don't get duplicates using the % operator
                  //They are then gathered in a list using the spread operator with a sizedbox in between every plant
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < widget.currentHouse.pots.length; i++)
                        if (i % 2 == 0) ...[
                          GhPlant(
                            currentPot: widget.currentHouse.pots[i],
                            manager: widget.manager,
                            potId: i,
                          ),
                          const SizedBox(height: 10.0),
                        ],
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < widget.currentHouse.pots.length; i++)
                        if (i % 2 == 1) ...[
                          GhPlant(
                            currentPot: widget.currentHouse.pots[i],
                            manager: widget.manager,
                            potId: i,
                          ),
                          const SizedBox(height: 10.0),
                        ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
