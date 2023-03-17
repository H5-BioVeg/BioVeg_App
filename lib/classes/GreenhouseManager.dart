import 'dart:convert';
import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';
import 'package:workmanager/workmanager.dart';

//MOVE TO MAIN
@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    GreenhouseManager().getSensorReadings("ardId");

    return Future.value(true);
  });
}

class GreenhouseManager {
  late List<Greenhouse> greenhouses;

  GreenhouseManager() {
    greenhouses = List.empty(growable: true);
    Workmanager().initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    Workmanager().registerOneOffTask("sensorReadingsTask", "sensorTask",
        initialDelay: Duration(minutes: 2));
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
    //Make a new list to hold the greenhouses

    try {
      FirebaseDbConnector conn = FirebaseDbConnector();

      //Get the info from database
      String dbContent = (await conn.getGreenhousesFromDb());

      //Map
      Map<String, dynamic> dbCMap = json.decode(dbContent.toString());

      //Make a Map of all the greenhouses
      Map<String, dynamic> greenMap = dbCMap['greenhouses'];

      //Go through each greenhouse and create an object of it
      greenMap.forEach((key, value) {
        greenhouses.add(Greenhouse.fromJson(value));
      });
    } catch (e) {
      print(e);
    }
    return greenhouses;
  }

  Future<void> getSensorReadings(String ardId) async {
    try {
      print(greenhouses.length);
      if (greenhouses.isNotEmpty) {
        FirebaseDbConnector conn = FirebaseDbConnector();
        //Get data from database
        String? dbContent = (await conn.getSensorReadings());

        Map<String, dynamic> greenMap = json.decode(dbContent);

        // greenhouses.forEach((element) {
        //   if (element.arduinoId == "d") {}
        // });
        print(greenMap.keys);
      }
    } catch (e) {
      print("erferfefefeffegegegg  ${e}");
    }
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
