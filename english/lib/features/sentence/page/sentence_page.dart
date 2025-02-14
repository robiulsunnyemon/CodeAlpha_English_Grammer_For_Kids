import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors/colors.dart';

class SentenceScreen extends StatefulWidget {
  const SentenceScreen({super.key});

  @override
  _SentenceScreenState createState() => _SentenceScreenState();
}

class _SentenceScreenState extends State<SentenceScreen> {
  final String sentenceDefinition =
      'A sentence is a group of words that expresses a complete thought. It must have at least a subject and a predicate.';

  final List<String> sentenceTypes = [
    'Assertive: It makes a statement or expresses a fact or opinion.',
    'Interrogative: It asks a question.',
    'Imperative: It gives a command or request.',
    'Optative: It expresses a wish, desire, or hope.',
    'Exclamatory: It shows strong emotion.',
    'Simple: It contains a subject and a verb and expresses a complete thought.',
    'Complex: It contains one independent clause and at least one dependent clause.',
    'Compound: It contains two independent clauses joined by a conjunction.',
  ];


  final List<String> sentenceParts = [
    'Subject: The person or thing the sentence is about.',
    'Predicate: What the subject does or is.',
    'Object: The receiver of the action.',
    'Complement: Adds more information about the subject or object.',
  ];

  final List<String> sentenceStructures = [
    'Simple Sentence: Contains a subject and a verb and expresses a complete thought.',
    'Compound Sentence: Contains two independent clauses joined by a conjunction.',
    'Complex Sentence: Contains an independent clause and at least one dependent clause.',
    'Compound-Complex Sentence: Contains two independent clauses and at least one dependent clause.',
  ];



  final Map<String, String> quizQuestions = {
    '___ is playing soccer.': 'He',
    '___ you like ice cream?': 'Do',
    'Please ___ your homework.': 'complete',
    'What a beautiful ___!': 'day',
  };

  final Map<String, String> sentenceExamples = {
    'Simple Sentence': 'She reads books.',
    'Compound Sentence': 'I wanted to go to the park, but it started raining.',
    'Complex Sentence': 'Although it was raining, I went for a walk.',
    'Compound-Complex Sentence': 'Although it was raining, I went for a walk, and I saw my friends there.',
    'Assertive Sentence': 'I love to learn new languages.',
    'Interrogative Sentence': 'Do you like ice cream?',
    'Imperative Sentence': 'Please close the door.',
    'Optative Sentence': 'I wish I could travel the world.',
    'Exclamatory Sentence': 'Wow, that’s amazing!',
    'Negative Sentence': 'He does not like chocolate.',
    'Interrogative-Assertive Sentence': 'Could you tell me the time?',
    'Exclamatory-Imperative Sentence': 'What a beautiful view, let’s take a picture!',
    'Negative-Imperative Sentence': 'Don’t go there.',
    'Affirmative Sentence': 'She is a talented singer.',
    'Conditional Sentence': 'If it rains, we will stay inside.',
    'Explanatory Sentence': 'The sun rises in the east.',
    'Relative Sentence': 'The book that I read was interesting.',
  };


  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    setState(() {
      showResult = true;
      String correctAnswer = quizQuestions.values.elementAt(currentQuestionIndex);
      resultMessage = userAnswer.trim().toLowerCase() == correctAnswer
          ? 'Correct! 🎉'
          : 'Incorrect, please try again!';
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % quizQuestions.length;
      userAnswer = '';
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sentences",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            Text(
              'Definition of Sentence:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(sentenceDefinition),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Types of Sentences:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceTypes
                    .map((type) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(type),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Parts of a Sentence:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceParts
                    .map((part) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(part),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Sentence Structures:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceStructures
                    .map((structure) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(structure),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Examples of Sentence Types:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceExamples.entries
                    .map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text('${entry.key}: ${entry.value}'),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Quiz: Complete the Sentence',
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quizQuestions.keys.elementAt(currentQuestionIndex),
                  style: TextStyle(fontSize: 16.sp),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8).r),
                    foregroundColor: Colors.orangeAccent,
                    elevation: 0,
                  ),
                  child: Text(
                    'Next Question',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the missing word',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                userAnswer = value;
              },
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: checkAnswer,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Check Answer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(height: 16.h),
            if (showResult)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0).w,
                child: Text(
                  resultMessage,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: resultMessage.contains('Correct')
                        ? Colors.teal
                        : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
