import 'package:car_project2/models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  final List<CarModel> cars;

  const QuizPage({super.key, required this.cars});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.cars[currentQuestion].url),
                Text(
                  widget.cars[currentQuestion].name,
                  style: GoogleFonts.nunito(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  widget.cars[currentQuestion].difficulty,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                CupertinoButton(
                  color: Colors.yellow,
                  onPressed: () {
                    currentQuestion++;
                    setState(() {});
                  },
                  child: Center(child: Text("Next")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
