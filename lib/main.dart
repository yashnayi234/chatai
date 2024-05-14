import 'package:chatai/screen/chathome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  final String apiKey = await storage.read(key: 'test your api key') ?? '';
  // await dotenv.load(fileName: "./.env");
  runApp(MyApp(apiKey: apiKey));
}
class MyApp extends StatelessWidget {
  final String apiKey;
  MyApp({required this.apiKey});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ChatAIHomeScreen(apiKey: apiKey),
    );
  }
}
