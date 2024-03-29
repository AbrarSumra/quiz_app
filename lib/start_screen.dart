import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz_logo.png",
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          "'Learn Flutter the Fun Way!'",
          style: GoogleFonts.lato(fontSize: 28, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 20),
            )),
      ],
    ));
  }
}
