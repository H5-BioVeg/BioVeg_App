import 'package:bio_veg/screens/PlantDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GhPlant extends StatefulWidget {
  const GhPlant({super.key, this.plantName = "Test"});

  final String plantName;

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
              builder: (context) => PlantDetailsScreen(
                plantName: "plantName",
                earthHumidity: 80,
                type: PlantTypes.Agurk,
              ),
            ));
      }),
      child: Ink(
        color: Color.fromARGB(255, 42, 205, 127),
        child: Container(
          constraints: BoxConstraints(maxWidth: 175, minWidth: 140),
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
                    widget.plantName),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.water_drop_outlined),
                  Text(style: TextStyle(fontSize: 20), "Fugt mål"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
