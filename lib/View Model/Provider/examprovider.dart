import 'dart:async';
import 'package:flutter/material.dart';

class ExamProvider extends ChangeNotifier {
  final Map<String, dynamic> exam;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int selectedOptionIndex = -1; // Initialize with an invalid index
  Map<int, int> _selectedOptions = {};
  // Timer variables
  late Duration examDuration;
  late Duration remainingTime;
  Timer? timer;

  ExamProvider(this.exam) {
    examDuration = const Duration(minutes: 1);
    remainingTime = examDuration;

    // Start the timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime -= const Duration(seconds: 1);
        notifyListeners();
      } else {
        timer.cancel();
        notifyListeners();
      }
    });
  }
  int getSelectedOptionIndexForQuestion(int questionIndex) {
    return _selectedOptions[questionIndex] ??
        -1; // Return -1 if no option is selected
  }

  // Set selected option for a particular question
  void setSelectedOptionForQuestion(int questionIndex, int optionIndex) {
    _selectedOptions[questionIndex] = optionIndex;
    notifyListeners(); // Notify listeners to update the UI
  }

  void submitAnswer(int selectedOptionIndex) {
    final question = exam['questions'][currentQuestionIndex];
    if (selectedOptionIndex == question['answerIndex']) {
      correctAnswers++;
    }

    // Update the selected answer index
    this.selectedOptionIndex = selectedOptionIndex;

    if (currentQuestionIndex < exam['questions'].length - 1) {
      currentQuestionIndex++;
    }
    notifyListeners();
  }

  Map<int, int> _selectedAnswers =
      {}; // Tracks selected options for each question

  int getSelectedOption(int questionIndex) {
    return _selectedAnswers[questionIndex] ??
        -1; // Return -1 if no option selected
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      notifyListeners();
    }
  }

  void stopTimer() {
    timer?.cancel();
  }

  double get timePercentage {
    final totalTime = Duration(minutes: 1); // Example total time
    return (remainingTime.inSeconds / totalTime.inSeconds);
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
