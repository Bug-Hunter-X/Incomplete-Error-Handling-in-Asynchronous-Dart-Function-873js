```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('HTTP error! Status code: ${response.statusCode}', response.body);
    }
  } on SocketException catch (e) {
    throw Exception('Network error: $e');
  } on FormatException catch (e) {
    throw Exception('JSON format error: $e');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}

class HttpException implements Exception {
  final String message;
  final String? responseBody;
  HttpException(this.message, this.responseBody);
  @override
  String toString() => message;
}
```