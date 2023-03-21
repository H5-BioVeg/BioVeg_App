import 'dart:convert';
import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';

class GreenhouseManager {
  late List<Greenhouse> greenhouses;

  GreenhouseManager();

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
    //Make a new list to hold the greenhouses
    greenhouses = List.empty(growable: true);

    try {
      FirebaseDbConnector conn = FirebaseDbConnector();

      //Get the info from database
      String dbContent = (await conn.getGreenhousesFromDb());

      //Map
      Map<String, dynamic> dbCMap = json.decode(dbContent.toString());

      //Make a Map of all the greenhouses
      Map<String, dynamic> greenMap = dbCMap['greenhouses'];
      greenMap.forEach((key, value) {
        greenhouses.add(Greenhouse.fromJson(value));
      });
      //Go through each greenhouse and create an object of it
    } catch (e) {
      print(e);
    }
    return greenhouses;
  }

  void updateGreenHouse(Greenhouse currentHouse, String path) {
    FirebaseDbConnector dbConn = FirebaseDbConnector();
    dbConn.updateGreenHouse(currentHouse, path);
  }

  void updatePot(Pot currentPot, String path) {
    FirebaseDbConnector dbConn = FirebaseDbConnector();
    dbConn.updatePot(currentPot, path);
  }
}
