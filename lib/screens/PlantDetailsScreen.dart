import 'package:bio_veg/dialogs/ShowInfoPopUpDialog.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';
import 'package:bio_veg/PlantTemplate.dart';
import 'package:bio_veg/classes/Podo/Pot.dart';

class PlantDetailsScreen extends StatefulWidget {
  //this constructor should take an object of a plant or other related type
  //For now it only takes three values for show purposes
  PlantDetailsScreen({super.key, required this.plant});

  late Pot plant;

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

late TextEditingController _titleEditingController;

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //Maybe move this to an initialize method
    _titleEditingController = TextEditingController.fromValue(
        TextEditingValue(text: widget.plant.name));
    bool settingsChanged = false;
    //On back widget and function
    return WillPopScope(
      onWillPop: () async {
        //Save changes if any
        if (settingsChanged) {}
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.greenAccent,
            title: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.mode_edit_outline_outlined),
              ),
              controller: _titleEditingController,
              style: const TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  widget.plant.name = value;
                  //Also do save db
                });
              },
            )),
        body: Column(
          children: [
            //Dropdown wrapped in styling
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 228, 228),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
                        child: DropdownButton<PlantTemplates>(
                          hint: Text(widget.plant.name),
                          value: widget.plant.plantTemplate,
                          //For each enum, make an item in the dropdown
                          items: PlantTemplates.values
                              .map((PlantTemplates plantType) {
                            return DropdownMenuItem<PlantTemplates>(
                              value: plantType,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(plantType.name
                                    .replaceAll('oe', 'ø')
                                    .toString()),
                              ),
                            );
                          }).toList(),
                          //On dropdown changed
                          onChanged: (value) {
                            setState(() {
                              if (value != null &&
                                  widget.plant.plantTemplate != value) {
                                widget.plant.plantTemplate = value;
                                settingsChanged = true;
                                //Set new values on sliders
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //Info button for dropdown templates
                  IconButton(
                    icon: const Icon(Icons.info),
                    splashRadius: 20,
                    color: const Color.fromARGB(255, 16, 66, 153),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ShowInfoPopUpDialog(
                            title: "Type",
                            content:
                                "Hvis du er i tvivl om hvad din slider skal stå på, kan du vælge ud fra en skabelon. Disse er anbefalede værdier for den gældende plante. Hvis du ændrer i en skabelon, vil ændringerne kun være for den gældende plante og ikke alle med samme skabelon."),
                      );
                    },
                  ),
                ],
              ),
            ),
            //Humidity right now
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop,
                      color: Colors.blueAccent, size: 36),
                  Text(
                    EarthHumidityLevels
                        .values[widget.plant.currentSoilMoisture].name,
                    style: const TextStyle(fontSize: 23),
                  )
                ],
              ),
            ),
            //Humidity Title and info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Fugt i jorden", style: TextStyle(fontSize: 28)),
                IconButton(
                    splashRadius: 20,
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const ShowInfoPopUpDialog(
                            title: "Fugt I jorden & Slider",
                            content:
                                "En indikator for hvor fugtig jorden er. (opdaterer hvert kvarter)\n\nEn minimum og maximum værdi for hvor tør og vådjorden må være. Du vil blive alarmeret hvis de bliver overskredet.")),
                    icon: const Icon(Icons.info,
                        color: Color.fromARGB(255, 16, 66, 153))),
              ],
            ),
            //Rangeslider for humidity
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 5, 18, 0),
                  child: SfRangeSlider(
                    values: SfRangeValues(
                        widget.plant.soilMoistureSettings.soilMoistureMin,
                        widget.plant.soilMoistureSettings.soilMoistureMax),
                    min: 0,
                    max: 4,
                    interval: 1,
                    stepSize: 1,
                    showTicks: true,
                    showLabels: true,
                    labelFormatterCallback: (actualValue, formattedText) {
                      return actualValue % 1 == 0
                          ? EarthHumidityLevels
                              .values[int.parse(
                                  actualValue.toString().substring(0, 1))]
                              .name
                              .replaceAll('aa', 'å')
                              .replaceAll('_', ' ')
                              .replaceAll('oe', 'ø')
                          : "";
                    },
                    //On pop, save changes to DB
                    onChanged: (values) {
                      setState(() {
                        widget.plant.soilMoistureSettings.soilMoistureMin =
                            values.start;
                        widget.plant.soilMoistureSettings.soilMoistureMax =
                            values.end;
                        settingsChanged = true;
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
