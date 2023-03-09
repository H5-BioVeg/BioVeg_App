import 'package:bio_veg/dialogs/DeletePopUpDialog.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GreenHouseSettingsScreen extends StatefulWidget {
  const GreenHouseSettingsScreen({super.key});

  @override
  State<GreenHouseSettingsScreen> createState() =>
      _GreenHouseSettingsScreenState();
}

//Change this when View models have been sat up
TextEditingController _settingsController =
    TextEditingController.fromValue(const TextEditingValue(text: 'Flim'));
SfRangeValues _currentTempRange = const SfRangeValues(0, 40);
SfRangeValues _currenthumidityRange = const SfRangeValues(0, 100);

class _GreenHouseSettingsScreenState extends State<GreenHouseSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          //We can make this into a widget or something, since it will be used multiple places
          title: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.mode_edit_outline_outlined),
            ),
            controller: _settingsController,
            style: const TextStyle(fontSize: 30),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                    style: TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                    ),
                    'Temperatur'),
                const SizedBox(height: 5),
                SizedBox(
                  width: 250,
                  child: SfRangeSlider(
                    values: _currentTempRange,
                    min: 0,
                    max: 40,
                    interval: 1,
                    stepSize: 1,
                    showLabels: true,
                    enableTooltip: true,
                    labelFormatterCallback: (actualValue, formattedText) {
                      if (actualValue == 0) {
                        return '0°C';
                      } else if (actualValue == 40) {
                        return '40°C';
                      }
                      return '';
                    },
                    tooltipTextFormatterCallback: (actualValue, formattedText) {
                      return '$formattedText°C';
                    },
                    onChanged: (values) {
                      setState(() {
                        _currentTempRange = values;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                    style: TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                    ),
                    'Luftfugtighed'),
                const SizedBox(height: 5),
                SizedBox(
                  width: 250,
                  child: SfRangeSlider(
                    values: _currenthumidityRange,
                    min: 0,
                    max: 100,
                    interval: 2,
                    stepSize: 1,
                    showLabels: true,
                    enableTooltip: true,
                    labelFormatterCallback: (actualValue, formattedText) {
                      if (actualValue == 0) {
                        return '0%';
                      } else if (actualValue == 100) {
                        return '100%';
                      }
                      return '';
                    },
                    tooltipTextFormatterCallback: (actualValue, formattedText) {
                      return '$formattedText%';
                    },
                    onChanged: (values) {
                      setState(() {
                        _currenthumidityRange = values;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text("Slet Drivhus"),
                      onPressed: () {
                        //Show delete pop up modal
                        showDialog(
                                context: context,
                                builder: (context) => const DeletePopUpDialog())
                            .then((value) {
                          if (value) {
                            //If value = true, delete the greenhouse
                          }
                        });
                      },
                    ),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
