import 'dart:convert';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<String> getGreenhousesFromDb() async {
    //Code goes here
    DatabaseReference ref = database.ref('/');
    //Get entire db
    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      return jsonEncode(snapshot.value);
    } else {
      print('No data available.');
      return '';
    }
  }

  Future<String> getSensorReadings() async {
    DatabaseReference ref = database.ref("/");

    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      return jsonEncode(snapshot.value);
    } else {
      print('No data');
      return '';
    }
  }

  void updateGreenHouse(Greenhouse currentHouse, String path) async {
    try {
      DatabaseReference ref = database.ref(path);
      await ref.update(currentHouse.toJson());
    } catch (e) {
      print(e);
    }
  }

  void updatePot(Pot currentPot, String path) async {
    try {
      DatabaseReference ref = database.ref(path);
      await ref.update(currentPot.toJson());
    } catch (e) {
      print(e);
    }
  }
}
