import 'package:flutter/foundation.dart';

class SoilMoistureSettings {
  late int soilMoistureMin;
  late int soilMoistureMax;

  SoilMoistureSettings(int soilMin, int soilMax) {
    soilMoistureMin = soilMin;
    soilMoistureMax = soilMax;
  }

  factory SoilMoistureSettings.fromJson(dynamic json) {
    return SoilMoistureSettings(json['soilMin'], json['soilMax']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['soilMin'] = soilMoistureMin;
    data['soilMax'] = soilMoistureMax;
    return data;
  }
}
