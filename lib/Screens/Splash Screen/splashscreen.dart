// import 'package:exam_app/Utill/colors.dart';
import 'package:flutter/material.dart';
import 'package:sample_quiz/Screens/Exam%20Listing%20Screen/examlistscreen.dart';
import 'package:sample_quiz/Utill/colors.dart';

class SplashScreen extends StatefulWidget {
  final List<dynamic> exams;
  const SplashScreen({required this.exams});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ExamListScreen(
                  exams: widget.exams,
                )), // Replace 'YourNextScreen' with your next screen widget.
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    Widget buildBackgroundImage() {
      return Image.asset(
        "assets/images/Login Screen.png",
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
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenH / 7),
                    Center(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Util().whiteColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                "Exam",
                                style: TextStyle(
                                    fontFamily: "Baloo Semibold",
                                    color: Util().primaeryColor,
                                    height: 0.5,
                                    fontSize: 32),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                "App",
                                style: TextStyle(
                                    fontFamily: "Baloo Semibold",
                                    color: Util().secondoryColor,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
