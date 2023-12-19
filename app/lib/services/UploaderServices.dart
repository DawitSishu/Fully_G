import 'dart:convert';
import 'dart:io';
import 'package:Yene/services/AuthServices.dart';
import 'package:http/http.dart' as http;

Future uploadAudio(audio, name, {required bool isImage}) async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/creator/upload');

    if (token == null) {
      return {
        "success": false,
        "data": {"message": "Authentication failed"}
      };
    }

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final request = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields['isImage'] = isImage.toString()
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          await audio.readAsBytes(),
          filename: name,
          // Adjust the content type
        ),
      );

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return {
        "success": true,
        "data": responseData,
      };
    } else {
      return {
        "success": false,
        "data": {"message": "Failed to upload audio"},
      };
    }
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "please try again"}
    };
  }
}

Future<Map<String, dynamic>> uploadImageAndAudio({
  required File imageFile,
  required String imageName,
  required File audioFile,
  required String audioName,
}) async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/creator/upload');

    if (token == null) {
      return {
        "success": false,
        "data": {"message": "Authentication failed"}
      };
    }

    final Map<String, String> headers = {'Authorization': 'Bearer $token'};

    final imageRequest = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields['isImage'] = 'true' // Assuming it's an image upload
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          await imageFile.readAsBytes(),
          filename: imageName,
          // Adjust the content type
        ),
      );

    final imageResponse =
        await http.Response.fromStream(await imageRequest.send());

    if (imageResponse.statusCode != 200) {
      return {
        "success": false,
        "data": {"message": "Failed to upload image"}
      };
    }

    final Map<String, dynamic> imageResponseData =
        json.decode(imageResponse.body);

    // Now create a new request for audio upload
    final audioRequest = http.MultipartRequest('POST', url)
      ..headers.addAll(headers)
      ..fields['isImage'] = 'false' // Assuming it's not an image upload
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          await audioFile.readAsBytes(),
          filename: audioName,
          // Adjust the content type
        ),
      );

    final audioResponse =
        await http.Response.fromStream(await audioRequest.send());

    if (audioResponse.statusCode != 200) {
      return {
        "success": false,
        "data": {"message": "Failed to upload audio"}
      };
    }

    final Map<String, dynamic> audioResponseData =
        json.decode(audioResponse.body);

    return {
      "success": true,
      "data": {
        "image": imageResponseData,
        "audio": audioResponseData,
      },
    };
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "Please try again"},
    };
  }
}

Future<Map<String, dynamic>> createGift(data) async {
  try {
    final token = await getToken();
    final url = Uri.http('192.168.159.56:5000', '/api/creator/addGift');

    if (token == null) {
      return {
        "success": false,
        "data": {"message": "Authentication failed"}
      };
    }

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return {
        "success": true,
        "data": responseData,
      };
    } else {
      return {
        "success": false,
        "data": {"message": "Failed to create gift"}
      };
    }
  } catch (e) {
    print(e);
    return {
      "success": false,
      "data": {"message": "Please try again"},
    };
  }
}
