import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<Object?> getGreenhousesFromDb(String ownerId,
      {String masterId = ""}) async {
    //Code goes here
    DatabaseReference ref = database.ref(masterId);
    String json;
    //Get entire db
    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      return snapshot.value;
    } else {
      print('No data available.');
      return '';
    }
  }
}
