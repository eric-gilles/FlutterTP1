import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_home_page.dart';
import 'package:quiz_app/screens/quiz_page.dart';
import 'package:quiz_app/screens/quiz_result_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizHomePage(),
      initialRoute: '/',
      routes: {
        '/quiz': (context) => const QuizPage(title: 'Questions'),
        '/result': (context) => const QuizResultPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}