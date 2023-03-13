import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GhScanList extends StatefulWidget {

  // GhScanList(List<String> ips) {
  //   ipList = ips;
  // }
  late List<String> ipList = ["Drivhus 1", "Drivhus 22"];
  bool isChecked = false;
  @override
  State<GhScanList> createState() => _GhScanListState();

}

class _GhScanListState extends State<GhScanList> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Drivhuse fundet:"),
      content: Padding(
        padding: EdgeInsets.all(0.8),
        child: Container(
          height: 300,
          child: Column(children: [
            for(var item in widget.ipList ) 
                Row(
                  children: [
                    Text(item),
                    Checkbox(value: widget.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.isChecked = value!;
                  });
                })
                  ],
                ),
              ],
            ),
        )
        ),
      );
  }
}