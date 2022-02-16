import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  Future<bool> get connected async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
