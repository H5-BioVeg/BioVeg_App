import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<String> getGreenhousesFromDb() async {
    //Code goes here
    DatabaseReference ref = database.ref();
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
}
