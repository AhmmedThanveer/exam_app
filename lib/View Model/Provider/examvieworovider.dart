import 'package:flutter/material.dart';
import 'package:sample_quiz/Models/questionmodel.dart';
// import 'models/exam_model.dart';

class ExamViewModel with ChangeNotifier {
  List<Exam> _exams = [];
  Exam? _selectedExam;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int _totalQuestions = 0;
  Duration _remainingTime = Duration(minutes: 1); // Example timer

  List<Exam> get exams => _exams;
  Exam? get selectedExam => _selectedExam;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get correctAnswers => _correctAnswers;
  Duration get remainingTime => _remainingTime;

  void loadExams(List<Exam> exams) {
    _exams = exams;
    notifyListeners();
  }

  void selectExam(Exam exam) {
    _selectedExam = exam;
    _currentQuestionIndex = 0;
    _correctAnswers = 0;
    _totalQuestions = exam.questions.length;
    _remainingTime = Duration(minutes: 5);
    notifyListeners();
  }

  void submitAnswer(int selectedOption) {
    if (_selectedExam == null) return;
    final question = _selectedExam!.questions[_currentQuestionIndex];
    if (selectedOption == question.answerIndex) {
      _correctAnswers++;
    }
    if (_currentQuestionIndex < _totalQuestions - 1) {
      _currentQuestionIndex++;
    }
    notifyListeners();
  }

  void decrementTimer() {
    if (_remainingTime.inSeconds > 0) {
      _remainingTime -= Duration(seconds: 1);
      notifyListeners();
    }
  }

  double calculateScore() {
    return (_correctAnswers / _totalQuestions) * 100;
  }
}
