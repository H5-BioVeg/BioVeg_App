import 'package:bio_veg/classes/GreenhouseManager.dart';
import 'package:bio_veg/classes/Enums.dart';
import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/classes/Podo/GreenhouseSetting.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';
import 'package:bio_veg/classes/Podo/SoilMoistureSettings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Can fetch data from Firebasedb', () async {
    final GreenhouseManager manager = GreenhouseManager();
    List<Greenhouse> houses = await manager.getGreenhousesFromDb();
    expect(houses, isNot(null));
  });

  test('Throws error on empty data', () async {
    final GreenhouseManager manager = GreenhouseManager();
    expect(manager.getGreenhousesFromDb(),
        throwsA(const TypeMatcher<Exception>()));
  });

  test('Can change greenhouse name', () {
    final GreenhouseManager manager = GreenhouseManager();
    Greenhouse newHouse = Greenhouse(GreenHouseSettings(1, 40, 1, 40));

    manager.changeGhName(newHouse, 'New test name');
    expect(newHouse.name, 'New test name');
  });

  test('Can change greenhouse settings', () {
    final GreenhouseManager manager = GreenhouseManager();
    GreenHouseSettings oldSettings = GreenHouseSettings(1, 40, 1, 40);
    GreenHouseSettings newSettings = GreenHouseSettings(2, 80, 2, 80);
    Greenhouse house = Greenhouse(oldSettings);

    manager.changeGhSettings(house, newSettings);
    expect(house.settings, newSettings);
    expect(house.settings, isNot(oldSettings));
  });

  test('Can change pot settings', () {
    final GreenhouseManager manager = GreenhouseManager();
    Greenhouse house = Greenhouse(GreenHouseSettings(1, 40, 1, 40));
    SoilMoistureSettings oldSettings = SoilMoistureSettings(1, 5);
    SoilMoistureSettings newSettings = SoilMoistureSettings(2, 10);
    house.pots = List.empty(growable: true);
    house.pots.add(Pot('testPot', PlantTemplates.Ananas, 50, oldSettings));

    manager.changePotSettings(house.pots[0], newSettings);

    expect(house.pots[0].soilMoistureSettings, newSettings);
    expect(house.pots[0].soilMoistureSettings, isNot(oldSettings));
  });

  test('Can change pot name', () {
    final GreenhouseManager manager = GreenhouseManager();
    Greenhouse house = Greenhouse(GreenHouseSettings(1, 40, 1, 40));
    house.pots = List.empty(growable: true);
    house.pots.add(
        Pot('testPot', PlantTemplates.Ananas, 50, SoilMoistureSettings(1, 5)));

    manager.changePotName(house.pots[0], 'new Name');

    expect(house.pots[0].name, 'new Name');
  });
}
