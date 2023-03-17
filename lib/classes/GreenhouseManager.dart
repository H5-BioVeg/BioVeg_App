import 'dart:convert';
import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class GreenhouseManager {
  late List<Greenhouse> greenhouses;

  GreenhouseManager() {
    //later
  }

  Future<List<Greenhouse>> scanForGreenhouse() async {
    //Code goes here
    return List.empty();
  }

  void addGreenhouses(List<Greenhouse> ghs) {
    //Code goes here
    greenhouses.addAll(ghs);
  }

  ///Gets Greenhouses from the firebase DB
  ///
  ///Returns a list of greenhouses
  ///
  ///Need to be async if return type is Future
  Future<List<Greenhouse>> getGreenhousesFromDb() async {
    //Code goes here
    FirebaseDbConnector conn = FirebaseDbConnector();

    Object? dbContent = (await conn.getGreenhousesFromDb());

    String dbCStr = jsonEncode(dbContent);
    Map<String, dynamic> dbCMap = json.decode(dbCStr);

    List<Greenhouse> greenhouses = List.empty(growable: true);

    Map<String, dynamic> de = dbCMap['greenhouses'];
    de.forEach((key, value) {
      greenhouses.add(Greenhouse.fromJson(value));
    });
    print(greenhouses[0]);
    return greenhouses;
  }

  void getSensorReadings(String ardId) {
    //Code goes here
  }

  //Unnecessary?
  bool changeGhName(Greenhouse gh, String newName) {
    //Code goes here
    return false;
  }

  //Unnecessary?
  bool changePotName(Pot pot, String newName) {
    //Code goes here
    return false;
  }

  //Unnecessary?
  bool changePotSettings(Pot pot, SoilMoistureSettings settings) {
    //Code goes here
    return false;
  }

  //Unnecessary?
  bool changeGhSettings(Greenhouse gh, GreenHouseSettings settings) {
    //Code goes here
    return false;
  }

  void deleteGreenhouse(String id) {
    //Code goes here
    greenhouses.removeWhere((element) => element.arduinoId == id);
  }
}
