import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:flutter/material.dart';

class ConvertToColor {
  ///Helper method for returning a background color, depending on greenhouse state
  static Color convertGreenhouseToColor(Greenhouse gh) {
    if (gh.temperature > gh.settings.temperatureMin &&
        gh.temperature < gh.settings.humidityMax) {
      return Colors.greenAccent;
    } else if (gh.temperature > gh.settings.temperatureMax ||
        gh.temperature < gh.settings.temperatureMin) {
      return Colors.redAccent;
    }
    return Colors.yellowAccent;
  }

  ///Helper method for returning a background color, depending on pots state
  static Color convertPotToColor(Pot pot) {
    if (pot.currentSoilMoisture > pot.soilMoistureSettings.soilMoistureMin &&
        pot.currentSoilMoisture < pot.soilMoistureSettings.soilMoistureMax) {
      return Colors.greenAccent;
    } else if (pot.currentSoilMoisture >
            pot.soilMoistureSettings.soilMoistureMax ||
        pot.currentSoilMoisture < pot.soilMoistureSettings.soilMoistureMin) {
      return Color.fromARGB(255, 254, 129, 129);
    }
    return Colors.yellowAccent;
  }
}
