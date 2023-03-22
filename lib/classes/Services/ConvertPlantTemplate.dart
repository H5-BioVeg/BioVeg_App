import 'package:bio_veg/classes/Enums.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';

class ConvertPlantTemplate {
  ///Converts a template into a SfRangeValues used in the slider
  static SfRangeValues convertTemplateToRangeValues(Pot pot) {
    switch (pot.plantTemplate) {
      case PlantTemplates.Agurk:
        return const SfRangeValues(1, 3);
      case PlantTemplates.Ananas:
        return const SfRangeValues(2, 3);
      case PlantTemplates.Foraarsloeg:
        return const SfRangeValues(1, 2);
      case PlantTemplates.Loeg:
        return const SfRangeValues(0, 2);
      case PlantTemplates.Peberfrugt:
        return const SfRangeValues(1, 4);
      case PlantTemplates.Tomat:
        return const SfRangeValues(0, 3);
      case PlantTemplates.Custom:
        return SfRangeValues(pot.soilMoistureSettings.soilMoistureMin,
            pot.soilMoistureSettings.soilMoistureMax);
    }
  }
}
