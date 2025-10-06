import 'package:car_project2/models/car_model.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final List<CarModel> cars;
  const QuizPage({super.key, required this.cars});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
