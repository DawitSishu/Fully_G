import 'dart:convert';
import 'package:Yene/services/AuthServices.dart';
import 'package:http/http.dart' as http;

Future getUserInfo() async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/users/me');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(url, headers: headers);
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "data": data};
    }
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}

Future UpdatePro(Bodydata) async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/users/updateProfile');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.put(
      url,
      headers: headers,
      body: json.encode(Bodydata),
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "data": data};
    }
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}

Future AddLoveId(love_id) async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/users/addId');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.put(
      url,
      headers: headers,
      body: json.encode({"uid": love_id}),
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "data": data};
    }
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}
