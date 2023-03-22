import 'package:bio_veg/classes/Enums.dart';
import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Services/ConvertIntToHumidityLevel.dart';
import 'package:bio_veg/classes/Services/ConvertToColor.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/screens/PlantDetailsScreen.dart';
import 'package:flutter/material.dart';

class GhPlant extends StatefulWidget {
  GhPlant(
      {super.key,
      required this.currentPot,
      required this.manager,
      required this.potId});

  late final GreenhouseManager manager;
  late Pot currentPot;
  late int potId;

  @override
  State<GhPlant> createState() => _GhPlantState();
}

class _GhPlantState extends State<GhPlant> {
  @override
  Widget build(BuildContext context) {
    //Ripple effect on click
    return InkWell(
      splashColor: Colors.white,
      onTap: (() async {
        //Go to plant details
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(name: "pots/pot${widget.potId}"),
              builder: (context) =>
                  PlantDetailsScreen(plant: widget.currentPot),
            ));
        // When a BuildContext is used from a StatefulWidget, the mounted property
        // must be checked after an asynchronous gap.
        if (!mounted) {
          return;
        }
        if (result != null) {
          setState(() {
            widget.currentPot = result as Pot;
            widget.manager.updatePot(widget.currentPot, 
            ModalRoute.of(context)!.settings.name.toString() + 'pots/' + widget.currentPot.id);
          });
        }
      }),
      child: Ink(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 175, minWidth: 140),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              //Color needs to change depending on restrictions in the plant
              color: ConvertToColor.convertPotToColor(widget.currentPot),
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
                    widget.currentPot.name),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop_outlined),
                  Text(
                    style: const TextStyle(fontSize: 20),
                    EarthHumidityLevels
                        .values[ConvertIntToHumidityLevel.getEnumHumVal(widget.currentPot.currentSoilMoisture)].name
                        .replaceAll('aa', 'å')
                        .replaceAll('_', ' ')
                        .replaceAll('oe', 'ø'),
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
