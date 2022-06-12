import 'dart:convert';

import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final url = "";

  Future<List<PicsumResult>> getData() async {
    final uri = Uri.parse(url);
    List<PicsumResult> result = [];
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body);
      list.map((e) => result.add(PicsumResult.fromMap(e)));
    }
    return result;
  }
}
