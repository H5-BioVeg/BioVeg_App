import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/screens/PlantDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../classes/Enums.dart';

class GhPlant extends StatefulWidget {
  const GhPlant({super.key, required this.pot});

  final Pot pot;

  @override
  State<GhPlant> createState() => _GhPlantState();
}

class _GhPlantState extends State<GhPlant> {
  @override
  Widget build(BuildContext context) {
    //Ripple effect on click
    return InkWell(
      splashColor: Colors.white,
      onTap: (() {
        //Go to plant details
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlantDetailsScreen(plant: widget.pot),
            ));
      }),
      child: Ink(
        color: const Color.fromARGB(255, 42, 205, 127),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 175, minWidth: 140),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              //Color needs to change depending on restrictions in the plant
              border: Border.all(color: Colors.black38, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          //Set min width of columns
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    widget.pot.name),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop_outlined),
                  Text(
                      style: const TextStyle(fontSize: 20),
                      EarthHumidityLevels
                        .values[widget.pot.currentSoilMoisture].name
                          .replaceAll('aa', 'å')
                          .replaceAll('_', ' ')
                          .replaceAll('oe', 'ø')
                          ,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
