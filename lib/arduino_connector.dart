import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';
class ArduinoConnector
 {
  String scanForGreenHouses() {
    final stream = NetworkAnalyzer.discover2('192.168.0', 80, timeout: Duration(milliseconds: 5000));
    stream.listen((NetworkAddress addr) {
      if(addr.exists){
        
        DebugPrintCallback debugPrint = debugPrintThrottled;
        debugPrint(addr.ip);
      }
      else {
        print('No');
      }
    }).onDone(() => print('Done'));
    return "dd";
  }
}