import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class ApiService {
  static const String baseUrl = "http://api.marketstack.com/v1";
  static const String accesskey = "b8cabffa93dfcd536249d67b2aab95c4";
  Future getAlltickers() async {
    var allTickerUri = Uri.parse("$baseUrl/tickers?access_key=$accesskey");
    final result = await http.get(allTickerUri);
    if (kDebugMode) {
      print(result.statusCode);
      print(result.body);
    }
    AppConstants.tickerList = json.decode(result.body);

    return json.decode(result.body);
  }

  Future getEod(String symbol, String dateFrom, String dateTo) async {
    print("From filter : $dateFrom .....$dateTo,");
    var getEod = Uri.parse(
        "$baseUrl?access_key=$accesskey&symbols=$symbol&date_from=$dateFrom&date_to=$dateTo");
    final result = await http.get(getEod);
    if (kDebugMode) {
      print(result.body);
    }
    AppConstants.tickerList2 = json.decode(result.body);
    print(
        "From filter : $dateFrom .....$dateTo, ${AppConstants.tickerList['date'].length}");
    return json.decode(result.body);
  }
}
