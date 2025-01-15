import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sample_quiz/Utill/colors.dart';
import 'package:sample_quiz/View%20Model/Provider/examprovider.dart';

class QuizQuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(int) onOptionSelected;

  const QuizQuestionWidget({
    Key? key,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examProvider = Provider.of<ExamProvider>(context);
    final percentage = examProvider.timePercentage;
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Baloo Semibold",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Util().whiteColor,
              radius: 40,
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 6.0,

                percent: percentage, // adjust progress as needed
                center: Text(
                  "${(examProvider.remainingTime.inSeconds % 60).toString().padLeft(2, '0')}",
                  style: TextStyle(fontFamily: "Baloo Semibold", fontSize: 25),
                ),
                progressColor: const Color(0xFF004643),
                backgroundColor: Util().UnprogressColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final examProvider = Provider.of<ExamProvider>(context);
              final isSelected = examProvider.selectedOptionIndex == index;
              return GestureDetector(
                onTap: () => onOptionSelected(index),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFABD1C6) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        options[index],
                        style: TextStyle(
                          fontFamily: "Baloo Semibold",
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      if (isSelected)
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: const Color(0xFF004643),
                          child: Icon(
                            Icons.done,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
