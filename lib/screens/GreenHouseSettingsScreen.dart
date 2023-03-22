import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GreenHouseSettingsScreen extends StatefulWidget {
  GreenHouseSettingsScreen({super.key, required this.house});

  late Greenhouse house;
  bool _settingsChanged = false;
  late final _settingsController =
      TextEditingController.fromValue(TextEditingValue(text: house.name));

  @override
  State<GreenHouseSettingsScreen> createState() =>
      _GreenHouseSettingsScreenState();
}

class _GreenHouseSettingsScreenState extends State<GreenHouseSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
              onPressed: () {
                //If any changes have been made,
                //pop the current house to update it on returning to home screen
                if (widget._settingsChanged) {
                  Navigator.pop(context, widget.house);
                } else {
                  Navigator.pop(context, null);
                }
              },
              icon: const Icon(Icons.arrow_back)),
          //Editable title textfield
          title: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.mode_edit_outline_outlined),
            ),
            controller: widget._settingsController,
            style: const TextStyle(fontSize: 30),
            onChanged: (value) {
              setState(() {
                //Do not set texteditingcontroller.val in the setstate,
                //as it messes with the input when you type
                widget.house.name = value;
                widget._settingsChanged = true;
              });
            },
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
                    values: SfRangeValues(widget.house.settings.temperatureMin,
                        widget.house.settings.temperatureMax),
                    min: 0,
                    max: 40,
                    interval: 1,
                    stepSize: 1,
                    showLabels: true,
                    enableTooltip: true,
                    //Format labels so it'll only show the end values 0 and 40
                    labelFormatterCallback: (actualValue, formattedText) {
                      if (actualValue == 0) {
                        return '0°C';
                      } else if (actualValue == 40) {
                        return '40°C';
                      }
                      return '';
                    },
                    tooltipTextFormatterCallback: (actualValue, formattedText) {
                      //add °C to the end of the tooltip popup text
                      return '$formattedText°C';
                    },
                    onChanged: (values) {
                      setState(() {
                        widget.house.settings.temperatureMin =
                            values.start.toInt();
                        widget.house.settings.temperatureMax =
                            values.end.toInt();
                        widget._settingsChanged = true;
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
                    values: SfRangeValues(widget.house.settings.humidityMin,
                        widget.house.settings.humidityMax),
                    min: 0,
                    max: 100,
                    interval: 2,
                    stepSize: 1,
                    showLabels: true,
                    enableTooltip: true,
                    //Format labels so it'll only show the end values 0 and 100
                    labelFormatterCallback: (actualValue, formattedText) {
                      if (actualValue == 0) {
                        return '0%';
                      } else if (actualValue == 100) {
                        return '100%';
                      }
                      return '';
                    },
                    tooltipTextFormatterCallback: (actualValue, formattedText) {
                      //add % to the end of the tooltip popup text
                      return '$formattedText%';
                    },
                    onChanged: (values) {
                      setState(() {
                        widget.house.settings.humidityMin =
                            values.start.toInt();
                        widget.house.settings.humidityMax = values.end.toInt();
                        widget._settingsChanged = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
