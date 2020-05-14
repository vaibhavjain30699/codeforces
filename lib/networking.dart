import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class NetworkHelper {
  Future getContestData() async {
    http.Response response = await http.get(url_contest);
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      print(response.statusCode);
  }
}
