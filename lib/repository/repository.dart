import 'dart:convert';
import 'dart:developer';

import 'package:demo_app/model/user_model.dart';
import 'package:http/http.dart';

class UseRepository {
  String url = "https://fakestoreapi.com/products";

  Future<List<UserModel>> getUsers() async {
    log("api is calling");
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
