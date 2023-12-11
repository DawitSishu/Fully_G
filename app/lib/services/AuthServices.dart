import 'dart:convert';

import 'package:http/http.dart' as http;

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
    final url = Uri.http('192.168.42.56:5000', '/api/users/signup');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(bodyData),
    );

    final data = json.decode(response.body);
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
    final url = Uri.http('192.168.42.56:5000', '/api/users/login');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(bodyData),
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "data": data};
    }
  } catch (e) {
    // TODO
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}
