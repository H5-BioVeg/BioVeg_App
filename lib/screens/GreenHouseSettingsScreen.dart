import 'package:bio_veg/classes/Podo/Greenhouse.dart';
import 'package:bio_veg/dialogs/DeletePopUpDialog.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../classes/GreenhouseManager.dart';

class GreenHouseSettingsScreen extends StatefulWidget {
  GreenHouseSettingsScreen(
      {super.key, required this.house, required this.manager});

  late Greenhouse house;
  late final GreenhouseManager manager;
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
    return WillPopScope(
      //On back function
      onWillPop: () async {
        if (widget._settingsChanged) {
          //Send new changes to settings
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            //We can make this into a widget or something, since it will be used multiple places
            title: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.mode_edit_outline_outlined),
              ),
              controller: widget._settingsController,
              style: const TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  widget.house.name = value;
                  //Also do save db
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
                      values: SfRangeValues(
                          widget.house.settings.temperatureMin,
                          widget.house.settings.temperatureMax),
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
                      tooltipTextFormatterCallback:
                          (actualValue, formattedText) {
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
                      labelFormatterCallback: (actualValue, formattedText) {
                        if (actualValue == 0) {
                          return '0%';
                        } else if (actualValue == 100) {
                          return '100%';
                        }
                        return '';
                      },
                      tooltipTextFormatterCallback:
                          (actualValue, formattedText) {
                        return '$formattedText%';
                      },
                      onChanged: (values) {
                        setState(() {
                          widget.house.settings.humidityMin =
                              values.start.toInt();
                          widget.house.settings.humidityMax =
                              values.end.toInt();
                          widget._settingsChanged = true;
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
                              builder: (context) =>
                                  const DeletePopUpDialog()).then((value) {
                            if (value) {
                              //If value = true, delete the greenhouse
                              //Delete greenhouse
                              Navigator.of(context)
                                  .popUntil(ModalRoute.withName('/'));
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
      ),
    );
  }
}
