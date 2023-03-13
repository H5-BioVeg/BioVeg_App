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
}
