import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getUserInfo() async {
  try {} catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}
