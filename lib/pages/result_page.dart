import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  final int corrects;

  const ResultPage({super.key, required this.corrects});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${widget.corrects}/10",
          style: GoogleFonts.nunito(
            fontSize: 100,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CupertinoButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Back to Home"),
      ),
    );
  }
}
