class GreenHouseSettings {
  late int temperatureMin;
  late int temperatureMax;
  late int humidityMin;
  late int humidityMax;

  GreenHouseSettings(int tempMin, int tempMax, int humMin, int humMax){
    temperatureMin = tempMin;
    temperatureMax = tempMax;
    humidityMin = humMin;
    humidityMax = humMax;
  }
}