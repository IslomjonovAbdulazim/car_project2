import 'package:car_project2/models/car_model.dart';
import 'package:car_project2/pages/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class QuizPage extends StatefulWidget {
  final List<CarModel> cars;

  const QuizPage({super.key, required this.cars});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  List<QuestionModel> question = [];
  int totalCorrect = 0;

  @override
  void initState() {
    generateQuestion();
    super.initState();
  }

  void generateQuestion() {
    widget.cars.shuffle();
    final car10 = widget.cars.sublist(0, 10);
    final names = widget.cars.map((value) => value.name).toList();
    for (var value in car10) {
      names.shuffle();
      final q = QuestionModel(
        logoUrl: value.url,
        options: [...names.sublist(0, 3), value.name],
        correct: value.name,
      );
      q.options.shuffle();
      question.add(q);
    }
    setState(() {});
  }

  void nextQuestion(String selected) {
    if (question[currentQuestion].correct == selected) {
      totalCorrect++;
    }
    if (currentQuestion == 9) {
      Get.off(ResultPage(corrects: totalCorrect));
    } else {
      currentQuestion++;
      setState(() {});
    }
  }

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
                Text(
                  "${currentQuestion + 1}/${question.length}",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "$totalCorrect✅ ${currentQuestion - totalCorrect}❌",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: widget.cars[currentQuestion].url,
                  ),
                ),
                Spacer(),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    nextQuestion(question[currentQuestion].options[0]);
                  },
                  child: Text(
                    question[currentQuestion].options[0],
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    nextQuestion(question[currentQuestion].options[1]);
                  },
                  child: Text(
                    question[currentQuestion].options[1],
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    nextQuestion(question[currentQuestion].options[2]);
                  },
                  child: Text(
                    question[currentQuestion].options[2],
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    nextQuestion(question[currentQuestion].options[3]);
                  },
                  child: Text(
                    question[currentQuestion].options[3],
                    style: GoogleFonts.nunito(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionModel {
  late String logoUrl;
  late List<String> options;
  late String correct;

  QuestionModel({
    required this.logoUrl,
    required this.options,
    required this.correct,
  });
}
