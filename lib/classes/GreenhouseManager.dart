import 'package:bio_veg/classes/Greenhouse.dart';
import 'package:bio_veg/classes/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Pot.dart';
import 'package:bio_veg/classes/SoilMoistureSettings.dart';

class GreenhouseManager {
  late List<Greenhouse> greenhouses;

  GreenhouseManager() {
    //later
  }

  List<Greenhouse> scanForGreenhouse() {
    //Code goes here
    return List<Greenhouse>.empty();
  }

  void addGreenhouses(List<Greenhouse> ghs) {
    //Code goes here
  }

  ///Gets Greenhouses from the firebase DB
  ///
  ///Returns a list of greenhouses
  ///
  ///Need to be async if return type is Future
  Future<List<Greenhouse>> getGreenhousesFromDb(String ownerId) async {
    //Code goes here
    await Future.delayed(Duration(seconds: 2));
    return List<Greenhouse>.empty();
  }

  void getSensorReadings(String ardId) {
    //Code goes here
  }

  bool changeGhName(Greenhouse gh, String newName) {
    //Code goes here
    return false;
  }

  bool changePotName(Pot pot, String newName) {
    //Code goes here
    return false;
  }

  bool changePotSettings(Pot pot, SoilMoistureSettings settings) {
    //Code goes here
    return false;
  }

  bool changeGhSettings(Greenhouse gh, GreenHouseSettings settings) {
    //Code goes here
    return false;
  }

  void deleteGreenhouse(String id) {
    //Code goes here
  }
}
