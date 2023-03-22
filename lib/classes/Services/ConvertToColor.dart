import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Services/ConvertIntToHumidityLevel.dart';
import 'package:flutter/material.dart';

class ConvertToColor {
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

  static Color convertPotToColor(Pot pot) {
    if (ConvertIntToHumidityLevel.getEnumHumVal(pot.currentSoilMoisture) > pot.soilMoistureSettings.soilMoistureMin &&
        ConvertIntToHumidityLevel.getEnumHumVal(pot.currentSoilMoisture) < pot.soilMoistureSettings.soilMoistureMax) {
      return Colors.greenAccent;
    } else if (ConvertIntToHumidityLevel.getEnumHumVal(pot.currentSoilMoisture) >
            pot.soilMoistureSettings.soilMoistureMax ||
        ConvertIntToHumidityLevel.getEnumHumVal(pot.currentSoilMoisture) < pot.soilMoistureSettings.soilMoistureMin) {
      return Color.fromARGB(255, 254, 129, 129);
    }
    return Colors.yellowAccent;
  }
}
