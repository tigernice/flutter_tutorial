import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../viewModels/QuizViewModel.dart';

class QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<QuizViewModel>.reactive(
      viewModelBuilder: () => QuizViewModel(),
      builder: (context , model , child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
            centerTitle: true,
          ),
          body: model.isQuizCompleted
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quiz Finished!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'bạn đúng ${model.score} / ${model.totalQuestions}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: model.resetQuiz,
                  child: Text('Restart Quiz'),
                ),
              ],
            ),
          )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'quiz',
                  child: Icon(
                    Icons.quiz,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.currentQuestion.questionText,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model.timeLeft}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ...model.currentQuestion.options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => model.submitAnswer(index),
                      child: Text(option),
                    ),
                  );
                }
                )
              ],
            )
          ),
        );
      },
    );
  }
}