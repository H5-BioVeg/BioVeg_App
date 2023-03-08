import 'package:bio_veg/screens/Greenhousescreen.dart';
import 'package:bio_veg/screens/TestScreen.dart';
import 'package:bio_veg/screens/Wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = "Bioveg"});

  final String drivhusName = "data2";
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontSize: 30),
        )),
      ),
      body: Center(
        //REplace this COLUMNS CHILDREN WITH A FUTURE BUILDER
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Greenhousescreen(
                              houseName: "Temp Name",
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(12)),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Text(
                          style: TextStyle(fontSize: 20),
                          "data",
                        ),
                        Spacer(),
                        Text(
                          style: TextStyle(fontSize: 20),
                          "25°C",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(width: 1.5),
                  borderRadius: BorderRadius.circular(12)),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                        style: const TextStyle(fontSize: 20),
                        widget.drivhusName),
                    const Spacer(),
                    Text(
                      style: TextStyle(fontSize: 20),
                      "25°C",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                  child: const Text("Scan for drivhuse"),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WifiTest(
                             
                            )),
                  );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
