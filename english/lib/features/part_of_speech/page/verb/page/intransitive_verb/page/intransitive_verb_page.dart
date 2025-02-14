import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/colors/colors.dart';


class IntransitiveVerbScreen extends StatefulWidget {
  const IntransitiveVerbScreen({super.key});

  @override
  IntransitiveVerbScreenState createState() => IntransitiveVerbScreenState();
}

class IntransitiveVerbScreenState extends State<IntransitiveVerbScreen> {
  final String intransitiveVerbDefinition =
      'An intransitive verb is an action verb that does not require an object to complete its meaning.';

  final String intransitiveVerbExample =
      'Example: She **sleeps** peacefully. ("sleeps" does not require an object)';

  final List<Map<String, String>> intransitiveVerbTable = [
    {'verb': 'Sleep', 'sentence': 'She sleeps peacefully.'},
    {'verb': 'Run', 'sentence': 'He runs fast.'},
    {'verb': 'Laugh', 'sentence': 'They laugh loudly.'},
    {'verb': 'Cry', 'sentence': 'The baby cries.'},
    {'verb': 'Arrive', 'sentence': 'He arrives late.'},
  ];

  final List<String> intransitiveVerbRules = [
    'An intransitive verb does not take a direct object.',
    'The sentence can end after the verb or be followed by an adverb or prepositional phrase.',
    'Ask "what?" or "whom?" after the verb. If there is no answer, it is intransitive.',
    'Example: "She sings." (Complete) vs "She sings a song." (Transitive)',
  ];

  final Map<String, String> quizQuestions = {
    'Sleep': 'She sleeps ___.',
    'Run': 'He runs ___.',
    'Laugh': 'They laugh ___.',
    'Cry': 'The baby cries ___.',
    'Arrive': 'He arrives ___.',
  };

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    setState(() {
      showResult = true;
      resultMessage = userAnswer.trim().isNotEmpty
          ? 'Correct! 🎉'
          : 'Please enter a phrase to complete the sentence!';
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
          "Intransitive Verbs",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: ListView(
          children: [
            Text(
              'Definition of Intransitive Verbs:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(intransitiveVerbDefinition),
            Text(intransitiveVerbExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Identifying Intransitive Verbs:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: intransitiveVerbRules
                    .map((rule) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text("• $rule"),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Examples of Intransitive Verbs:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Verb')),
                  DataColumn(label: Text('Example Sentence')),
                ],
                rows: intransitiveVerbTable
                    .map(
                      (example) => DataRow(
                    cells: [
                      DataCell(Text(example['verb']!)),
                      DataCell(Text(example['sentence']!)),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
            SizedBox(height: 24.h),
            Divider(),
            SizedBox(height: 24.h),
            Text(
              'Quiz: Complete the Sentence',
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor,),
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
                labelText: 'Enter a phrase',
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
