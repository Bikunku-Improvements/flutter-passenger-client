import 'dart:convert';

import 'package:passenger_client/api/homepage.dart' as homepageUrls;
import 'package:passenger_client/homepage/data/terminal.dart';
import 'package:http/http.dart' as http;

class TerminalApi {
  Future<List<Terminal>> listTerminals() async {
    final response = await http.get(Uri.parse(homepageUrls.allTerminals));
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return (decodedResponse['data']['terminal'] as List)
        .map((json) => Terminal.fromJson(json))
        .toList();
  }
}
