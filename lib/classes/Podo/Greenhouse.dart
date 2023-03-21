import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';

class Greenhouse {
  late List<Pot> pots;
  late String name;
  late GreenHouseSettings settings;
  late int temperature;
  late int humidity;
  late String arduinoId;

  Greenhouse(GreenHouseSettings ghSettings) {
    settings = ghSettings;
  }

  factory Greenhouse.fromJson(Map<String, dynamic> json) {
    print(json);
    Greenhouse gh = Greenhouse(GreenHouseSettings.fromJson(json['ghSettings']));
    gh.name = json['name'];
    gh.temperature = json['temperature'];
    gh.humidity = json['humidity'];
    gh.arduinoId = json['masterId'];
    //Create a list for all the pots in the greenhouse
    gh.pots = List.empty(growable: true);
    //Create Map of the pots in the greenhouse
    Map<String, dynamic> potsData = json['pots'];
    //Go through each pot and create an object of each one
    potsData.forEach((key, value) {
      gh.pots.add(Pot.fromJson(value));
    });
    return gh;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['masterId'] = arduinoId;
    data['ghSettings'] = settings.toJson();
    data['pots'] = pots.map((v) => v.toJson()).toList();
    return data;
  }
}
