import 'dart:convert';

import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final url = "https://picsum.photos/v2/list";

  Future<List<PicsumResult>> getData() async {
    final uri = Uri.parse(url);
    List<PicsumResult> result = [];
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body);
      for (var element in list) {
        result.add(PicsumResult.fromMap(element));
      }
      debugPrint(result.toString());
    }
    return result;
  }
}
