import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTProvider {
  final String _apiKey = "YOUR_API_KEY";
  final String _baseUrl = "https://api.openai.com/v1/completions";

  Future<String> getResponse({required String prompt}) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: json.encode({
        'model': 'text-davinci-003',
        'prompt': prompt,
        'max_tokens': 100,
        'temperature': 0.5,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['choices'][0]['text'];
    } else {
      throw Exception('Failed to load chatGPT response');
    }
  }
}