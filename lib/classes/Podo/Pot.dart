import 'package:bio_veg/PlantTemplate.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class Pot {
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;
  late int currentSoilMoisture;

  Pot(PlantTemplates template, int currentMoisture,
      SoilMoistureSettings settings) {
    plantTemplate = template;
    currentSoilMoisture = currentMoisture;
    soilMoistureSettings = settings;
  }
}
