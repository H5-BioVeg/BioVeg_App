import 'package:bio_veg/classes/Enums.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class Pot {
  late String name;
  late SoilMoistureSettings soilMoistureSettings;
  late PlantTemplates plantTemplate;
  late int currentSoilMoisture;

  Pot(String name2, PlantTemplates template, int currentMoisture,
      SoilMoistureSettings settings) {
    name = name2;
    plantTemplate = template;
    currentSoilMoisture = getEnumHumVal(currentMoisture);
    print(currentSoilMoisture);
    soilMoistureSettings = settings;
  }

  factory Pot.fromJson(dynamic json) {
    print(json);
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
    data['plantTemplate'] = plantTemplate as int;
    data['soilMoistureSettings'] = soilMoistureSettings;
    return data;
  }
}
