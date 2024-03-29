class ConvertIntToHumidityLevel {
//Converts the current moisture into the value corresponding with the correct enum
  static int getEnumHumVal(int currentMoist) {
    int enumVal = -1;
    if (currentMoist >= 0 && currentMoist < 250) {
      //Very wet
      return enumVal = 0;
    } else if (currentMoist >= 250 && currentMoist < 500) {
      //Wet
      return enumVal = 1;
    } else if (currentMoist >= 500 && currentMoist < 800) {
      //Moist
      return enumVal = 2;
    } else if (currentMoist >= 800 && currentMoist < 900) {
      //Dry
      return enumVal = 3;
    } else if (currentMoist >= 900 && currentMoist <= 1024) {
      //Very dry
      return enumVal = 4;
    }
    return enumVal;
  }
}
