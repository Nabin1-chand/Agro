import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  static Future<Response> signUp(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (ex) {
      throw Exception('An error occurred during sign-up: $ex');
    }
  }
}
