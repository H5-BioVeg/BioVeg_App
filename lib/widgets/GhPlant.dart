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
    return Container(
      child: Column(
        children: [
          Text(widget.plantName),
          Row(
            children: [
              Icon(Icons.water_drop_outlined),
              Text("Fugt mål"),
            ],
          ),
        ],
      ),
    );
  }
}
