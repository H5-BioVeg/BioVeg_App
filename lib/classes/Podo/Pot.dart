import 'package:bio_veg/classes/Enums.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class Pot {
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;
  late int currentSoilMoisture;

  Pot(String potName, PlantTemplates template, int currentMoisture,
      SoilMoistureSettings settings) {
    name = potName;
    plantTemplate = template;
    currentSoilMoisture = getEnumHumVal(currentMoisture);
    soilMoistureSettings = settings;
  }


  factory Pot.fromJson(dynamic json) {
    return Pot(
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
