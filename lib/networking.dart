import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class NetworkHelper {
  Future<dynamic> getContestData() async {
    http.Response response = await http.get(url_contest);
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      print(response.statusCode);
  }

  Future<dynamic> getUserDetails(String username) async {
    String url = '$kUserInfoUrl$username';
    http.Response response = await http.get(url);
    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      print(response.statusCode);
  }
}
