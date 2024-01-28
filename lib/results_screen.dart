import 'package:flutter/material.dart';

import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionSummary(summaryData),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: TextButton.icon(
                onPressed:
                    onRestart /*() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Quiz()));
                }*/
                ,
                icon: const Icon(
                  Icons.refresh_sharp,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
