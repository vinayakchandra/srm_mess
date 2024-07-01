import 'dart:convert';
import 'package:http/http.dart' as http;

class MessService {
  final String gpUrl =
      'https://vinayakchandra.github.io/GPMess-api/GPMess.json';
  final String sannasiUrl =
      'https://script.googleusercontent.com/macros/echo?user_content_key=BlNuF3tfponiWh4_7nk3URFMbcgA_6A5Ex1l9i-7IxZyjwMrrKJeYnn5xoN-_M6D_GBiPZcTBzJbDE1_-eCA-ej_higUzXO2OJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa8J4NQyrVEFMtB0_KJVYuOT_3bQKrHo7NkqtUPg2gdSiiSDTapmBxaiEQCVX2MjV4g-KpqedECJYHF0hyHl7ss-YBYggDTTSTEJjikwa16IO-sxGS-3BWS1id3ZL8DJkJg&lib=ME6R_9-iwVkE5ZAWFx9_jKCyrCrPpogKk';

  Future<Map<String, dynamic>> gpMenu() async {
    final response = await http.get(Uri.parse(gpUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load menu');
    }
  }

  Future<Map<String, dynamic>> sannasiMenu() async {
    final response = await http.get(Uri.parse(sannasiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}

int currentDay = DateTime.now().weekday;

decreaseDay() {
  if (currentDay == 1) {
    currentDay = 7;
  } else {
    currentDay--;
  }
}

increaseDay() {
  if (currentDay == 7) {
    currentDay = 1;
  } else {
    currentDay++;
  }
}
