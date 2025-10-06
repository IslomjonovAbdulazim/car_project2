import 'package:car_project2/models/car_model.dart';
import 'package:car_project2/pages/quiz_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  List<CarModel> cars = [];
                  for (var value in CarModel.allCars) {
                    if (value.difficulty == "hard") {
                      cars.add(value);
                    }
                  }
                  Get.to(QuizPage(cars: cars));
                },
                child: Text("HARD"),
              ),
              SizedBox(height: 16),
              CupertinoButton(
                onPressed: () {
                  List<CarModel> cars = [];
                  for (var value in CarModel.allCars) {
                    if (value.difficulty == "medium") {
                      cars.add(value);
                    }
                  }
                  Get.to(QuizPage(cars: cars));
                },
                child: Text("MEDIUM"),
              ),
              SizedBox(height: 16),
              CupertinoButton(
                onPressed: () {
                  List<CarModel> cars = [];
                  for (var value in CarModel.allCars) {
                    if (value.difficulty == "easy") {
                      cars.add(value);
                    }
                  }
                  Get.to(QuizPage(cars: cars));
                },
                child: Text("EASY"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
