import 'package:bio_veg/dialogs/ShowInfoPopUpDialog.dart';
import 'package:flutter/material.dart';

enum PlantTypes { Custom, Tomat, Agurk, Chili, Loeg, Hvidloeg }

enum EarthHumidityLevels { Meget_toer, Toer, Fugtig, Vaad, Meget_vaad }

class PlantDetailsScreen extends StatefulWidget {
  late String plantName;
  late PlantTypes type;
  late int earthHumidity;

  //this constructor should take an object of a plant or other related type
  //For now it only takes three values for show purposes
  PlantDetailsScreen(
      {super.key,
      this.plantName = "Dev",
      this.type = PlantTypes.Custom,
      this.earthHumidity = 0});

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

RangeValues _currenthumidityRange = const RangeValues(0, 4);
late TextEditingController _titleEditingController;

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //Maybe move this to an initialize method
    _titleEditingController = TextEditingController.fromValue(
        TextEditingValue(text: widget.plantName.toString()));

    return Scaffold(
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
          )),
      body: Container(
          child: Column(
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
                      child: DropdownButton<PlantTypes>(
                        hint: Text(widget.type.name),
                        value: widget.type,
                        items: PlantTypes.values.map((PlantTypes plantType) {
                          return DropdownMenuItem<PlantTypes>(
                            value: plantType,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(plantType.name
                                  .replaceAll('oe', 'ø')
                                  .toString()),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          //Do method for changing plant data and type
                          setState(() {
                            if (value != null) {
                              widget.type = value;
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
                  '${widget.earthHumidity}%',
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
              Container(
                width: 400,
                child: RangeSlider(
                  values: _currenthumidityRange,
                  activeColor: const Color.fromARGB(255, 62, 207, 67),
                  inactiveColor: const Color.fromARGB(255, 220, 220, 220),
                  min: 0,
                  max: 4,
                  divisions: 4,
                  //This needs a hefty dose of god
                  labels: RangeLabels(
                      EarthHumidityLevels
                          .values[_currenthumidityRange.start.round()].name
                          .toString()
                          .replaceAll('aa', 'å')
                          .replaceAll('oe', 'ø')
                          .replaceAll('_', ' '),
                      EarthHumidityLevels
                          .values[_currenthumidityRange.end.round()].name
                          .toString()
                          .replaceAll('aa', 'å')
                          .replaceAll('oe', 'ø')
                          .replaceAll('_', ' ')),
                  onChanged: ((values) {
                    setState(() {
                      _currenthumidityRange = values;
                    });
                  }),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
