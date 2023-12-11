import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}

Future<String?> getPhone() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('phone');
}

Future<String?> getLoveId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('loveId');
}

void fetchData() async {
  var url = 'http://192.168.42.56:5000';

  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('Response: ${response.body}');
    // Handle your data here
  } else {
    print('Failed to fetch data: ${response.statusCode}');
  }
}

// Future SignUP(bodyData) async {
//   try {
//     print(bodyData);
//     final url = Uri.http('192.168.42.56:5000', '/api/users/signup');
//     final response = await http.post(url, body: json.encode(bodyData));

//     final data = json.decode(response.body);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return {"success": true, "data": data};
//     } else {
//       return {"success": false, "data": data};
//     }
//   } catch (e) {
//     // TODO
//     print(e);
//     return {
//       "success": false,
//       "data": {"message": "please try again"}
//     };
//   }
// }
Future signUp(bodyData) async {
  try {
    print(bodyData);
    final url = Uri.http('192.168.159.56:5000', '/api/users/signup');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(bodyData),
    );

    final data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200 || response.statusCode == 201) {
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

//to be tested later dave
Future LogIn(bodyData) async {
  try {
    final url = Uri.http('192.168.159.56:5000', '/api/users/login');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(bodyData),
    );
    final prefs = await SharedPreferences.getInstance();
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await prefs.setString('token', data['token'].toString());
      await prefs.setString('userId', data['userId'].toString());
      await prefs.setString('phone', data['phone'].toString());
      await prefs.setString('loveId', data['love_id'].toString());
      return {"success": true, "data": data};
    } else {
      return {"success": false, "data": data};
    }
  } catch (e) {
    // TODO
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}
