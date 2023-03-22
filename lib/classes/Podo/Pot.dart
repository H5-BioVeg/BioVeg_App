import 'package:bio_veg/classes/Enums.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class Pot {
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;
  late int currentSoilMoisture;
  late String id;

  Pot(String potId, String potName, PlantTemplates template, int currentMoisture,
      SoilMoistureSettings settings) {
    id = potId;
    name = potName;
    plantTemplate = template;
    currentSoilMoisture = currentMoisture;
    soilMoistureSettings = settings;
  }


  factory Pot.fromJson(String potId, dynamic json) {
    return Pot(
      potId,
      json['name'],
      PlantTemplates.values[json['plantTemplate']],
      json['currentSoilMoisture'],
      SoilMoistureSettings.fromJson(json['soilMoistureSettings']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['currentSoilMoisture'] = currentSoilMoisture;
    data['plantTemplate'] = plantTemplate.index;
    data['soilMoistureSettings'] = soilMoistureSettings.toJson();
    return data;
  }
}
