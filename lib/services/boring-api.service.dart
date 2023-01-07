import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:me_bored/models/activity.model.dart';

class BoringApi {
  String apiBaseUrl = "https://www.boredapi.com/api/";

  Future<Activity> getRandomActivity() async {
    http.Response response = await http.get("${apiBaseUrl}activity");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Activity(data['activity'], Activity.fromTypeActivityString(data['type']), Activity.fromParticipantsNumber(data['participants']), data['price'].toDouble(), data['accessibility'].toDouble());
    } else {
      throw Exception('Failed to load Activity');
    }
  }
}
