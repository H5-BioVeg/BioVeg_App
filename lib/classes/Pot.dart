import 'package:bio_veg/PlantTemplate.dart';
import 'package:bio_veg/classes/SoilMoistureSettings.dart';

class Pot{
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;

  Pot(PlantTemplates template, SoilMoistureSettings settings){
    plantTemplate = template;
    soilMoistureSettings = settings;
  }
}