import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<String> getGreenhousesFromDb(String ownerId,
      {String masterId = ""}) async {
    //Code goes here
    DatabaseReference ref = database.ref(masterId);
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
    DatabaseReference ref = database.ref("/greenhouses");

    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      return jsonEncode(snapshot.value);
    }
    else {
      print('No data');
      return '';
    }
  }
  
}
