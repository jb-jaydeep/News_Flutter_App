import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Connection_Model.dart';
import '../Model/Helper_Class/helper.dart';
import '../Model/Model.dart';

class ConnectionProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectionModel connectivityModel =
      ConnectionModel(connectivityStatus: "waiting");

  void checkInternetConnectivity() {
    connectivityModel.connectivityStream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        connectivityModel.connectivityStatus = "WiFi";
        notifyListeners();
      } else if (connectivityResult == ConnectivityResult.mobile) {
        connectivityModel.connectivityStatus = "MobileData";
        notifyListeners();
      } else {
        connectivityModel.connectivityStatus = "waiting";
        notifyListeners();
      }
    });
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isdark = true;
  String textfieldSearch = "cricket";
  void Themechanger() {
    isdark = !isdark;
    notifyListeners();
  }

  void SearchText(String n) {
    textfieldSearch = n;
    notifyListeners();
  }
}

// class WeatherProvider extends ChangeNotifier {
//   SearchLocation searchLocation = SearchLocation(
//     locationController: TextEditingController(),
//     search: 'ukrain',
//   );
//   // Future<String> weatherData(String location) async {
//   //   searchLocation.search =
//   //       (await APIHelper.apiHelper.fetchWeatherDetails(location)) as String;
//   //   return searchLocation.search;
//   // }
//
//   // searchWeather(String search) {
//   //   searchLocation.search = search;
//   //   notifyListeners();
//   // }
//
//   // Future<Product?>? weatherData(String location) async {
//   //   searchLocation.search =
//   //       (await APIHelper.apiHelper.fetchWeatherDetails(location));
//   //   return searchLocation.search;
//   // }
// }
