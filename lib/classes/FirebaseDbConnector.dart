import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDbConnector {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  Future<Object?> getGreenhousesFromDb() async {
    //Code goes here
    DatabaseReference ref = database.ref('/');
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

  void saveChangesToGh(String path, Greenhouse gh) {
    DatabaseReference ref = database.ref(path);
    ref.update(gh.toJson());
  }

  void saveChangesToPot(String path, Pot pot) {
    DatabaseReference ref = database.ref(path);
    ref.update(pot.toJson());
  }
}
