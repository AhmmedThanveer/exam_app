import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:sample_quiz/Utill/colors.dart';
import 'package:sample_quiz/Widgets/mybutton.dart';

class ResultsScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  ResultsScreen({required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    final percentage = (correctAnswers / totalQuestions) * 100;
    final isPassed = percentage >= 50;
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    Widget buildBackgroundImage() {
      return Image.asset(
        "assets/images/Leaderboard Screen.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImage(),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leadingWidth: 100,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
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
              title: const Text(
                "Results",
                style: TextStyle(fontFamily: "Baloo Semibold", fontSize: 15),
              ),
            ),
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenH / 8),
                    CircularPercentIndicator(
                      radius: 50.0,
                      lineWidth: 5.0,
                      percent: percentage / 100,
                      center: Text(
                        "${percentage.toStringAsFixed(1)}%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isPassed ? Util().greenColor : Util().redColor,
                          fontFamily: "Baloo Medium",
                        ),
                      ),
                      progressColor:
                          isPassed ? Util().greenColor : Util().redColor,
                      backgroundColor: Util().UnprogressColor,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    percentage == 100
                        ? Text(
                            "Very Good",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Util().greenColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Baloo Semibold",
                            ),
                          )
                        : Text(
                            isPassed ? "Passed" : "Failed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: isPassed
                                  ? Util().greenColor
                                  : Util().redColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Baloo Medium",
                            ),
                          ),
                    SizedBox(height: screenH / 8),
                    Text(
                      "Score: ${percentage.toStringAsFixed(1)}%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Baloo Semibold",
                          color: Util().suvtextColor),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You answered $correctAnswers out of $totalQuestions correctly!",
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Baloo Semibold",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: MyButton(
                        backgroundColor: Util().primaeryColor,
                        onPressed: () => Navigator.pop(context),
                        text: "Back to Exam",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
