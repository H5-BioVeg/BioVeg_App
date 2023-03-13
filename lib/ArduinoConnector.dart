import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';

class ArduinoConnector{

  
  List<String> ScanForGreenhouses(){
    List<String> greenhouseIps = List.empty(growable: true);
    //Pings all network devices at once with discover2()
    final stream = NetworkAnalyzer.discover2('..', 81);
    stream.listen((NetworkAddress addr) {
      //Checks to see if the address exists as a device 
      if(addr.exists){
        //Add the found devices to the list
        greenhouseIps.add(addr.ip);
      }
    }).onDone(() => print("Done scanning"));
    return greenhouseIps;

  }
}