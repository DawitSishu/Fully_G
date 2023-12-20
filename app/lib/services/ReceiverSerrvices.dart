import 'dart:convert';
import 'dart:io';
import 'package:Yene/services/AuthServices.dart';
import 'package:http/http.dart' as http;

Future ReceiveGift() async {
  try {} catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}
