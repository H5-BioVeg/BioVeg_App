import 'package:flutter/foundation.dart';

class GreenHouseSettings {
  late int temperatureMin;
  late int temperatureMax;
  late int humidityMin;
  late int humidityMax;

  GreenHouseSettings(int tempMin, int tempMax, int humMin, int humMax) {
    temperatureMin = tempMin;
    temperatureMax = tempMax;
    humidityMin = humMin;
    humidityMax = humMax;
  }

  factory GreenHouseSettings.fromJson(json) {
    return GreenHouseSettings(
      json['tempMin'],
      json['tempMax'],
      json['humMin'],
      json['humMax'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tempMin'] = temperatureMin;
    data['tempMax'] = temperatureMax;
    data['humMin'] = humidityMin;
    data['humMax'] = humidityMax;
    return data;
  }
}
