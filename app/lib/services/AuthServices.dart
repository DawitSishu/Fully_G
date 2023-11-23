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
