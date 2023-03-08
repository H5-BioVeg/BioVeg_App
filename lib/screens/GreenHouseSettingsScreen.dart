import 'package:bio_veg/dialogs/DeletePopUpDialog.dart';
import 'package:flutter/material.dart';

class GreenHouseSettingsScreen extends StatefulWidget {
  const GreenHouseSettingsScreen({super.key});

  @override
  State<GreenHouseSettingsScreen> createState() =>
      _GreenHouseSettingsScreenState();
}

//Change this when View models have been sat up
TextEditingController _settingsController =
    TextEditingController.fromValue(const TextEditingValue(text: 'Flim'));
RangeValues _currentTempRange = const RangeValues(0, 40);
RangeValues _currenthumidityRange = const RangeValues(0, 100);

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
        child: Container(
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
                      'Temperature'),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 250,
                    child: RangeSlider(
                      values: _currentTempRange,
                      max: 40,
                      divisions: 32,
                      labels: RangeLabels(
                        '${_currentTempRange.start.round()}C',
                        '${_currentTempRange.end.round()}C',
                      ),
                      onChanged: ((RangeValues values) {
                        setState(() {
                          _currentTempRange = values;
                        });
                      }),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                      style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                      ),
                      'Humidity'),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 250,
                    child: RangeSlider(
                      values: _currenthumidityRange,
                      max: 100,
                      divisions: 50,
                      labels: RangeLabels(
                        '${_currenthumidityRange.start.round()}%',
                        '${_currenthumidityRange.end.round()}%',
                      ),
                      onChanged: ((RangeValues values) {
                        setState(() {
                          _currenthumidityRange = values;
                        });
                      }),
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
