import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CodeRunApi {
  final String _baseUrl = 'https://api.codex.jaagrav.in';

  // Run Code function
  Future<Map<String, String>> runCode(String code, String language, String input) async {
    final String apiUrl = _baseUrl;
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'code': code,
        'language': language,
        'input': input,
      },
    );
    if (response.statusCode == 200) {
      return {
        "output": jsonDecode(response.body)['output'].toString(),
        "error": jsonDecode(response.body)['error'].toString(),
      };
    } else {
      return {
        "output": response.statusCode.toString(),
        "error": response.body.toString(),
      };
    }
  }
}
