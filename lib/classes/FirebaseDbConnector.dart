import 'dart:async';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  String getGreenhousesFromDb(String ownerId, {String masterId = ""}) {
    return get('/') as String;
  }

  void saveGhSettings(String pathToGh, GreenHouseSettings newSettings) {
    try {
      Greenhouse gh =
          Greenhouse.fromJson(get(pathToGh) as Map<String, dynamic>);
      gh.settings = newSettings;
      save(pathToGh, gh.toJson());
    } catch (e) {
      print("Error in saveGhSettings:\n$e");
    }
  }

  void changeGhName(String pathToGh, String newName) {
    try {
      Greenhouse pot =
          Greenhouse.fromJson(get(pathToGh) as Map<String, dynamic>);
      pot.name = newName;
      save(pathToGh, pot.toJson());
    } catch (e) {
      print("Error in savePotSettings:\n$e");
    }
  }

  void savePotSettings(String pathToPot, SoilMoistureSettings newSettings) {
    try {
      Pot pot = Pot.fromJson(get(pathToPot) as Map<String, dynamic>);
      pot.soilMoistureSettings = newSettings;
      save(pathToPot, pot.toJson());
    } catch (e) {
      print("Error in savePotSettings:\n$e");
    }
  }

  void changePotName(String pathToPot, String newName) {
    try {
      Pot pot = Pot.fromJson(get(pathToPot) as Map<String, dynamic>);
      pot.name = newName;
      save(pathToPot, pot.toJson());
    } catch (e) {
      print("Error in savePotSettings:\n$e");
    }
  }

  Future<dynamic> get(String pathToObject) async {
    try {
      DatabaseReference ref = database.ref(pathToObject);
      final snapshot = await ref.get();
      if (snapshot.exists) {
        return snapshot.value;
      }
    } catch (e) {
      print(e.toString());
    }
    throw TimeoutException("Get couldnt retrieve data");
  }

  Future<dynamic> save(String path, dynamic json) async {
    try {
      DatabaseReference ref = database.ref(path);
      ref.set(json);
    } catch (e) {
      print(e.toString());
    }
    throw const FormatException("Save couldnt save properly data");
  }
}
