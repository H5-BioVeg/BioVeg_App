import 'dart:ffi';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';

class Greenhouse {
  late List<Pot> pots;
  late String name;
  late GreenHouseSettings settings;
  late Float temperature;
  late Float humidity;
  late String arduinoId;

  Greenhouse(GreenHouseSettings ghSettings) {
    settings = ghSettings;
  }

  factory Greenhouse.fromJson(Map<String, dynamic> json) {
    Greenhouse gh = Greenhouse(GreenHouseSettings.fromJson(json['ghSettings']));
    gh.name = json['name'];
    gh.temperature = json['temperature'];
    gh.humidity = json['humidity'];
    gh.arduinoId = json['masterId'];

    final potsData = json['pots'] as List<dynamic>;
    for (var i = 0; i < potsData!.length; i++) {
      if (potsData[i] != null) {
        gh.pots.add(Pot.fromJson(potsData[i]));
      }
    }
    return gh;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['arduinoId'] = arduinoId;
    data['settings'] = settings.toJson();

    if (pots != null) {
      data['pots'] = pots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
