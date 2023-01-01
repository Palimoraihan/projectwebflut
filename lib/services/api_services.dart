import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/my_model.dart';

class ApiService {
  Future<MyModel> myServer() async {
    final response = await http.get(Uri.parse(
        "https://myportofolio-21cd2-default-rtdb.asia-southeast1.firebasedatabase.app/projectview.json"));
    if (response.statusCode == 200) {
      return MyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Load data gagal');
    }
  }
}
