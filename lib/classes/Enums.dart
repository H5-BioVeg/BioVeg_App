enum PlantTemplates {
  Custom,
  Tomat,
  Agurk,
  Ananas,
  Loeg,
  Foraarsloeg,
  Peberfrugt
}

enum EarthHumidityLevels {
  Meget_vaad,
  Vaad,
  Fugtig,
  Toer,
  Meget_toer,
}

int getEnumHumVal(int currentMoist) {
  int enumVal = -1;
  if (currentMoist >= 0 && currentMoist < 250) {
    //Wet
    return enumVal = 0;
  } else if (currentMoist >= 250 && currentMoist < 500) {
    //A bit wet
    return enumVal = 1;
  } else if (currentMoist >= 500 && currentMoist < 800) {
    //Moist
    return enumVal = 2;
  } else if (currentMoist >= 800 && currentMoist < 900) {
    //A bit dry
    return enumVal = 3;
  } else if (currentMoist >= 900 && currentMoist <= 1024) {
    //Dry
    return enumVal = 4;
  }
  return enumVal;
}
