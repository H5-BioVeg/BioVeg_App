import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/GreenhouseManager.dart';
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
              future: widget.manager.getGreenhousesFromDb('ownerId'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Greenhouse> greenhouses =
                      snapshot.data!.toList(growable: true);

                  //Loop through greenhouses and create buttons
                  for (Greenhouse house in greenhouses) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: RouteSettings(
                                      name: "greenhouses/${house.name}"),
                                  builder: (context) => GreenHouseScreen(
                                        currentHouse: house,
                                      )));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.blue,
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
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text("Scan for drivhuse"),
                  onPressed: () async {
                    //SCAN NETWORK METHOD
                    /* List<Greenhouse> allGreenHouses = await widget.manager
                        .scanForGreenhouse(); //.then((value) => null);
                    List<Greenhouse> uniqueHouses = widget.manager.greenhouses
                        .where((element) => !allGreenHouses.contains(element))
                        .toList();

                    setState(() async {
                      //Use chosen houses instead of unique.
                      widget.manager.addGreenhouses(uniqueHouses);
                    }); */
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
