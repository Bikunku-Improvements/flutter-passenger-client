import 'dart:convert';
import 'dart:ffi';

import 'package:passenger_client/api/homepage.dart' as homepage_urls;
import 'package:passenger_client/homepage/data/terminal.dart';
import 'package:http/http.dart' as http;

class TerminalApi {
  static Future<List<Terminal>> listTerminals() async {
    final response = await http.post(Uri.parse(homepage_urls.allTerminals),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, double>{
          // TODO: Make this not hardcoded
          "lat": -6.361046716889507,
          "long": 106.8317240044786
        }));
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return (decodedResponse['data']['terminal'] as List)
        .map<Terminal>((json) => Terminal.fromMap(json))
        .toList();
  }
}
