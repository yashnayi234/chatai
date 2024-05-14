import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchAIResponse(String apiKey, String userMessage) async {
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/chat/completions'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer sk-proj-oSHWkJLz4Oqi0i91qdsHT3BlbkFJrft1Ln8Yz0yRhGIAd3Ik',
    },
    body: jsonEncode({
      'model': 'gpt-3.5-turbo', // Specify GPT-3.5-turbo model
      'messages': [
        {'role': 'user', 'content': userMessage}
      ]
    }),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    print('API Response: $jsonResponse'); // Debug: Print the response
    final choices = jsonResponse['choices'];
    if (choices != null && choices.isNotEmpty) {
      return choices[0]['message']['content'];
    } else {
      throw Exception('No response from AI');
    }
  } else {
    print('API Error: ${response.statusCode} - ${response.body}'); // Debug: Print error details
    throw Exception('Failed to load AI response');
  }
}
