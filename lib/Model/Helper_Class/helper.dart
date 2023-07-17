import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();
  // Future<Product?> fetchWeatherDetails(String location) async {
  //   String Url =
  //       "https://api.weatherapi.com/v1/forecast.json?key=e09f03988e1048d2966132426232205&q=";
  //   String Location = "$location&aqi=no";
  //
  //   String api = Url + Location;
  //
  //   http.Response response = await http.get(Uri.parse(api));
  //
  //   if (response.statusCode == 200) {
  //     Map decodedData = jsonDecode(response.body);
  //
  //     Product weatherData = Product.formMap(data: decodedData);
  //
  //     return weatherData;
  //   }
  //   return null;
  // }

  Future<List<Product>?> callApi({required String Search}) async {
    String Search = "cricket";
    String Url =
        "http://api.mediastack.com/v1/news?access_key=94c5cf2364264dfb5cd87854273682a1&keywords=$Search&countries=us";
    http.Response response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      List allData = decodedData['data'];
      List<Product> myData = [];
      allData.forEach((e) {
        myData.add(
          Product.formMap(data: e),
        );
      });
      return myData;
    }
    return null;
  }
}
