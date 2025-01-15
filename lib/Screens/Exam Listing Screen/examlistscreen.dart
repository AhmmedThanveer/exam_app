import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_quiz/Utill/colors.dart';
import 'package:sample_quiz/View%20Model/Provider/examprovider.dart';
import 'package:sample_quiz/Screens/Exam%20Screen/examscreen.dart';

class ExamListScreen extends StatelessWidget {
  final List<dynamic> exams;

  ExamListScreen({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util().bgColor,
      appBar: AppBar(
        backgroundColor: Util().bgColor,
        title: const Text(
          'Available Exams',
          style: TextStyle(fontFamily: "Baloo Medium"),
        ),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          final int questionCount =
              exam['questions'].length; // Get number of questions
          final int durationInSeconds =
              questionCount * 60; // Calculate total duration in seconds
          final double durationInMinutes =
              durationInSeconds / 60; // Convert to minutes

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  exam['examicon'],
                  height: 50,
                  width: 50,
                ),
              ),
              title: Text(
                exam['title'],
                style: TextStyle(
                  color: Util().blackColor,
                  fontFamily: "Baloo Medium",
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration: ${durationInMinutes.toStringAsFixed(0)} minutes',
                    style: TextStyle(
                      color: Util().blackColor.withOpacity(0.6),
                      fontFamily: "Baloo Medium",
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.question_answer_sharp,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${questionCount} questions',
                        style: TextStyle(
                          color: Util().blackColor.withOpacity(0.6),
                          fontFamily: "Baloo Medium",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                size: 22,
                color: Util().primaeryColor,
              ),
              onTap: () {
                // Navigate to the exam screen with selected exam
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => ExamProvider(
                          exam), // Pass selected exam to the provider
                      child: ExamScreen(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
