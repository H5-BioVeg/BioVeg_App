import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GreenHouseSettingsScreen extends StatefulWidget {
  const GreenHouseSettingsScreen({super.key});

  @override
  State<GreenHouseSettingsScreen> createState() =>
      _GreenHouseSettingsScreenState();
}

late TextEditingController _settingsController =
    TextEditingController.fromValue(TextEditingValue(text: 'Flim'));
FocusNode nameFocusNode = FocusNode();
RangeValues _currentTempRange = const RangeValues(0, 40);
RangeValues _CurrenthumidityRange = const RangeValues(0, 100);

class _GreenHouseSettingsScreenState extends State<GreenHouseSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
            style: TextStyle(fontSize: 30),
            controller: _settingsController,
            focusNode: nameFocusNode),
        actions: [
          IconButton(
            onPressed: (() {
              //Open edit name modal
              setState(() {
                nameFocusNode.requestFocus();
                print(_settingsController.text);
              });
            }),
            icon: Icon(Icons.mode_edit_outline_outlined),
          )
        ],
      ),
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
                  SizedBox(height: 5),
                  Container(
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
                  SizedBox(height: 5),
                  const Text(
                      style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                      ),
                      'Humidity'),
                  SizedBox(height: 5),
                  Container(
                    width: 250,
                    child: RangeSlider(
                      values: _CurrenthumidityRange,
                      max: 100,
                      divisions: 50,
                      labels: RangeLabels(
                        '${_CurrenthumidityRange.start.round()}%',
                        '${_CurrenthumidityRange.end.round()}%',
                      ),
                      onChanged: ((RangeValues values) {
                        setState(() {
                          _CurrenthumidityRange = values;
                        });
                      }),
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: MaterialButton(
                        color: Color.fromARGB(255, 231, 231, 231),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey),
                        ),
                        child: const Text("Slet Drivhus"),
                        onPressed: () {
                          //SCAN NETWORK METHOD
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
