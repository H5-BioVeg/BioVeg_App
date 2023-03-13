import 'dart:math';

import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Add House to Existing houses', () {
    final GreenhouseManager manager = GreenhouseManager();
    Greenhouse newHouse = Greenhouse(GreenHouseSettings(1, 40, 1, 40));

    manager.greenhouses = List.empty(growable: true);
    manager.greenhouses.add(Greenhouse(GreenHouseSettings(0, 0, 0, 0)));
    manager.addGreenhouses(List.filled(1, newHouse));

    expect(manager.greenhouses, isNot(null));
    expect(manager.greenhouses.length, isNot(1));
  });
}
