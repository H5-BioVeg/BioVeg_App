import 'package:bio_veg/classes/PlantTemplate.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class Pot {
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;
  late int currentSoilMoisture;

  Pot(String name, PlantTemplates template, int currentMoisture,
      SoilMoistureSettings settings) {
    name = name;
    plantTemplate = template;
    currentSoilMoisture = currentMoisture;
    soilMoistureSettings = settings;
  }

  factory Pot.fromJson(dynamic json) {
    return Pot(
      json['name'],
      PlantTemplates.values[json['plantTemplate']],
      json['currentMoisture'],
      SoilMoistureSettings.fromJson(json['soilMoistureSettings']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['currentSoilMoisture'] = currentSoilMoisture;
    data['plantTemplate'] = plantTemplate as int;
    data['soilMoistureSettings'] = soilMoistureSettings;
    return data;
  }
}
