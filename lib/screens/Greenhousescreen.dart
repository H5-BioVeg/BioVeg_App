import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Greenhousescreen extends StatelessWidget {
  const Greenhousescreen({super.key, this.houseName = "test"});

  final String houseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(houseName),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("column 1 data"),
                  Text("column 1 data"),
                ],
              ),
              Column(
                children: [
                  Text("column 2 data"),
                  Text("column 2 data"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
