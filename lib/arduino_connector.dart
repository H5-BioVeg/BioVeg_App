import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';

class ArduinoConnector
 {
  String scanForGreenHouses() {
    //Pings all network devices at once with discover2()
    final stream = NetworkAnalyzer.discover2('..', 81, timeout: Duration(milliseconds: 5000));
    stream.listen((NetworkAddress addr) {
      //Checks to see if the address exists as a device 
      if(addr.exists){
        //Print the found devices
        print(addr.ip);
      }
      else {
        print("No");
      }
    }).onDone(() => print('Done'));
    return "dd";
  }
}