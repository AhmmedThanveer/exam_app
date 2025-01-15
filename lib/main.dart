import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sample_quiz/Screens/Exam%20Listing%20Screen/examlistscreen.dart';
import 'package:sample_quiz/Screens/Splash%20Screen/splashscreen.dart';
import 'View Model/Provider/examprovider.dart';
// import 'Screens/examscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON file
  final String jsonString =
      await rootBundle.loadString('assets/exam_data.json');
  final Map<String, dynamic> jsonData = jsonDecode(jsonString);

  runApp(MyApp(exams: jsonData['exams']));
}

class MyApp extends StatelessWidget {
  final List<dynamic> exams;

  MyApp({required this.exams});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(exams: exams),
    );
  }
}
