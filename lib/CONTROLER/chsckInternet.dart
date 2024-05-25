import 'package:connectivity_plus/connectivity_plus.dart';

class Chek {
  Future<bool> checkconnectivity() async {
    bool? testconn;
    var result = await Connectivity().checkConnectivity();
    print("connetion $result\n ${result.first.name}");

    if (result.first.name.toString() == "wifi" &&
        result.last.name.toString() == "vpn") {
      testconn = true;
    } else {
      testconn = false;
    }
    print("conn state is $testconn");

    print("=================================================");
    return testconn;
  }
}
