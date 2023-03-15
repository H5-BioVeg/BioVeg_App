import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<String> getGreenhousesFromDb(String ownerId,
      {String masterId = ""}) async {
    //Code goes here
    DatabaseReference ref = database.ref(masterId);
    String json;
    //Get entire db
    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      return snapshot.exists.toString();
    } else {
      print('No data available.');
      return '';
    }
  }
}
