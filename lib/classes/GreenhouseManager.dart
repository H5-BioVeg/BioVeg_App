import 'dart:convert';
import 'package:bio_veg/classes/Services/ConvertIntToHumidityLevel.dart';
import 'package:bio_veg/classes/Services/NotificationService.Dart';
import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';

class GreenhouseManager {
  late List<Greenhouse> greenhouses;

  GreenhouseManager();

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

  ///Update greenhouse that the specified path
  ///
  ///will not override anything other than at the specified path
  void updateGreenHouse(Greenhouse currentHouse, String path) {
    FirebaseDbConnector dbConn = FirebaseDbConnector();
    dbConn.updateGreenHouse(currentHouse, path);
  }

  ///Update the values of pot at the specified path
  ///
  ///Will not override anything other than at the specified path

  void updatePot(Pot currentPot, String path) {
    FirebaseDbConnector dbConn = FirebaseDbConnector();
    dbConn.updatePot(currentPot, path);
  }

  ///Checks if any values are out of range
  ///
  ///Fires a notification if any problems were found
  void checkOutOfRange(Greenhouse house) {
    if (house.temperature > house.settings.temperatureMax ||
        house.temperature < house.settings.temperatureMin ||
        house.humidity > house.settings.humidityMax ||
        house.humidity < house.settings.humidityMin) {
      LocalNoticeService().addNotification('Problemer med ${house.name}!',
          'En af ${house.name}s værdier er uden for grænsen!',
          channel: 'Channel 1');
    }

    //Increment counter if any pots have exceeding values
    int problemCounter = 0;
    for (var i = 0; i < house.pots.length; i++) {
      if (ConvertIntToHumidityLevel.getEnumHumVal(
                  house.pots[i].currentSoilMoisture) >
              house.pots[i].soilMoistureSettings.soilMoistureMax ||
          ConvertIntToHumidityLevel.getEnumHumVal(
                  house.pots[i].currentSoilMoisture) <
              house.pots[i].soilMoistureSettings.soilMoistureMin) {
        problemCounter++;
      }
    }
    if (problemCounter > 0) {
      LocalNoticeService().addNotification('Planter i knibe!',
          'Der er $problemCounter problemer i dit drivhus: ${house.name}',
          channel: 'Channel 2');
    }
  }
}
