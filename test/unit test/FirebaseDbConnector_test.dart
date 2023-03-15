import 'package:bio_veg/classes/FirebaseDbConnector.dart';
import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Can fetch jsonData from Firebasedb', () async {
    final FirebaseDbConnector connector = FirebaseDbConnector();
    String json = await connector.getGreenhousesFromDb('/');
    expect(json, isNot(''));
    expect(json, isNot(null));
    expect(json.length, isNot(0));
  });
}
