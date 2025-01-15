import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_quiz/Screens/Exam%20Screen/Widgets/questionwidget.dart';
import 'package:sample_quiz/View%20Model/Provider/examprovider.dart';
import 'package:sample_quiz/Screens/Result%20Screen/resultscreen.dart';
import 'package:sample_quiz/Utill/colors.dart';
import 'package:sample_quiz/Widgets/mybutton.dart';

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final examProvider = Provider.of<ExamProvider>(context);
    final currentQuestion =
        examProvider.exam['questions'][examProvider.currentQuestionIndex];

    // Handle when time runs out
    if (examProvider.remainingTime.inSeconds == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              totalQuestions: examProvider.exam['questions'].length,
              correctAnswers: examProvider.correctAnswers,
            ),
          ),
        );
      });
    }
    final double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Util().bgColor,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              if (examProvider.currentQuestionIndex > 0) {
                examProvider.goToPreviousQuestion();
              } else {
                Navigator.pop(
                    context); // If on the first question, go back to the previous screen
              }
            },
            icon: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Util().primaeryColor,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  "Previous",
                  style: TextStyle(
                      color: Util().primaeryColor,
                      fontFamily: "Baloo Semibold",
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Util().bgColor,
        centerTitle: true,
        title: Text(
          "${examProvider.currentQuestionIndex + 1}/${examProvider.exam['questions'].length}",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Baloo Semibold",
            color: Util().primaeryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: QuizQuestionWidget(
              options: List<String>.from(currentQuestion['options']),
              question: currentQuestion['text'],
              // selectedOptionIndex: 2,
              onOptionSelected: (value) {
                examProvider.submitAnswer(value!);
              },
            ),
          ),
          if (examProvider.currentQuestionIndex ==
              examProvider.exam['questions'].length - 1)
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 20),
              child: MyButton(
                backgroundColor: Util().primaeryColor,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        totalQuestions: examProvider.exam['questions'].length,
                        correctAnswers: examProvider.correctAnswers,
                      ),
                    ),
                  );
                },
                text: "Next",
              ),
            ),
        ],
      ),
    );
  }
}
