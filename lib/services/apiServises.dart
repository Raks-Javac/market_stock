import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future getAlltickers() async {
    var allTickerUri = Uri.parse(
        "http://api.marketstack.com/v1/tickers?access_key=b8cabffa93dfcd536249d67b2aab95c4");
    final result = await http.get(allTickerUri);
    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }

  Future getEod(Symbol symbol, String eod, String interval) async {
    var getEod = Uri.parse(
        "http://api.marketstack.com/v1/tickers?access_key=b8cabffa93dfcd536249d67b2aab95c4$symbol$eod$interval");
    final result = await http.get(getEod);
    print(result.body);
    return json.decode(result.body);
  }
}
