import 'package:bio_veg/classes/ArduinoConnector.dart';
import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class GreenhouseManager {
  late List<Greenhouse> greenhouses;
  late ArduinoConnector arduinoConnector;

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
  Future<List<Greenhouse>> getGreenhousesFromDb(String ownerId) async {
    //Code goes here
    FirebaseDbConnector conn = FirebaseDbConnector();

    String json = await conn.getGreenhousesFromDb('dsa');
    print(json);
    return List.empty();
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
