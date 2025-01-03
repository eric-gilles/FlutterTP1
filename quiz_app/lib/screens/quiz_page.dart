import 'package:flutter/material.dart';
import 'package:quiz_app/repository/question_repository.dart';
import 'package:quiz_app/model/question.dart';

class QuizPage extends StatefulWidget {
  final String title;
  const QuizPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {
  final QuestionRepository _questionRepository = QuestionRepository();
  int _index = 0;
  int _score = 0;

  bool _checkAnswer(bool userChoice) {
    bool isCorrect = userChoice == _questionRepository.questions[_index].isCorrect;

    // Update the score if the answer is correct
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }

    return isCorrect;
  }

  Question _nextQuestion() {
    setState(() {
      if (_index < _questionRepository.questions.length - 1) {
        _index++;
      } else {
        Navigator.pushNamed(context, '/result', arguments: [_score, _questionRepository.questions.length]);
      }
    });
    return _questionRepository.questions[_index];
  }

  void _showAnswerFeedback(bool isCorrect) {
    // Show a SnackBar with the answer feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(
          alignment: Alignment.center,
          child: Text(
            isCorrect ? 'Correct!' : 'Incorrect!',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        duration: const Duration(milliseconds: 300),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questionRepository.questions[_index];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[50],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Question ${_index + 1} / ${_questionRepository.questions.length}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 180),
                ],
              ),
              // Display the image if available
              if (currentQuestion.questionImage.isNotEmpty)
                Image.asset(
                  currentQuestion.questionImage,
                  height: 200,
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  currentQuestion.questionText,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              // Answer buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bool isCorrect = _checkAnswer(true);
                      _showAnswerFeedback(isCorrect);
                      _nextQuestion();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'Vrai',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool isCorrect = _checkAnswer(false);
                      _showAnswerFeedback(isCorrect);
                      _nextQuestion();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'Faux',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}