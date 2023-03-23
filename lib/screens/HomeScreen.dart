import 'dart:async';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Services/ConvertToColor.dart';
import 'package:bio_veg/screens/GreenHouseScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.title = "Bioveg"});

  final String title;
  final GreenhouseManager manager = GreenhouseManager();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer.periodic(const Duration(minutes: 15), (Timer t) => setState(() {}));
    });
  }

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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //Builder for greenhouses
            FutureBuilder<List<Greenhouse>>(
              //Get db from database if any
              future: widget.manager.getGreenhousesFromDb(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Greenhouse> greenhouses =
                      snapshot.data!.toList(growable: true);

                  //Loop through greenhouses and create buttons
                  for (int i = 0; i < greenhouses.length; i++) {
                    Greenhouse house = greenhouses[i];
                    widget.manager.checkOutOfRange(house);
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: RouteSettings(
                                      //We use route names for finding the path to save elements in the firebase realtime database
                                      name: "greenhouses/greenhouse${i + 1}/"),
                                  builder: (context) => GreenHouseScreen(
                                        manager: widget.manager,
                                        currentHouse: house,
                                      )));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            color:
                                //Get a color from the helper method depending on the gh values
                                ConvertToColor.convertGreenhouseToColor(house),
                            border: Border.all(width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                    style: const TextStyle(fontSize: 20),
                                    house.name),
                                const Spacer(),
                                Text(
                                  style: const TextStyle(fontSize: 20),
                                  '${house.temperature}°C',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
