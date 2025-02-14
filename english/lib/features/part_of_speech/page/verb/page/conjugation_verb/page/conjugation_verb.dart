import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/colors/colors.dart';

class VerbConjugationScreen extends StatefulWidget {
  const VerbConjugationScreen({super.key});

  @override
  VerbConjugationScreenState createState() => VerbConjugationScreenState();
}

class VerbConjugationScreenState extends State<VerbConjugationScreen> {
  final String definition =
      'Verb conjugation refers to the modification of a verb from its basic form to reflect various tenses, persons, or numbers.';

  final String example =
      'Example: "I eat" (Present Tense), "I ate" (Past Tense), "I will eat" (Future Tense)';

  final List<Map<String, String>> conjugationTable = [
    {'tense': 'Present', 'I': 'eat', 'You': 'eat', 'He/She/It': 'eats', 'We': 'eat', 'They': 'eat'},
    {'tense': 'Past', 'I': 'ate', 'You': 'ate', 'He/She/It': 'ate', 'We': 'ate', 'They': 'ate'},
    {'tense': 'Future', 'I': 'will eat', 'You': 'will eat', 'He/She/It': 'will eat', 'We': 'will eat', 'They': 'will eat'},
  ];

  final List<String> rules = [
    'In the present tense, the verb may change slightly depending on the subject (e.g., "He eats" vs. "They eat").',
    'In the past tense, the verb usually takes the form of its past form (e.g., "ate" for "eat").',
    'In the future tense, "will" is used before the verb to indicate an action that will happen (e.g., "will eat").',
  ];

  final Map<String, String> quizQuestions = {
    'Present Tense - I __ to the store.': 'go',
    'Past Tense - He __ to the park.': 'went',
    'Future Tense - They __ to the party.': 'will go',
  };

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    setState(() {
      showResult = true;
      resultMessage = userAnswer.trim().isNotEmpty && userAnswer.trim().toLowerCase() == quizQuestions.values.elementAt(currentQuestionIndex).toLowerCase()
          ? 'Correct! 🎉'
          : 'Incorrect! Please try again.';
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
          "Conjugation of Verb",
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
              'Definition of Verb Conjugation:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(definition),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Verb Conjugation:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rules
                    .map((rule) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(rule),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Conjugation of Verbs (Present, Past, Future):',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2).w,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Tense')),
                    DataColumn(label: Text('I')),
                    DataColumn(label: Text('You')),
                    DataColumn(label: Text('He/She/It')),
                    DataColumn(label: Text('We')),
                    DataColumn(label: Text('They')),
                  ],
                  rows: conjugationTable
                      .map(
                        (conjugation) => DataRow(
                      cells: [
                        DataCell(Text(conjugation['tense']!)),
                        DataCell(Text(conjugation['I']!)),
                        DataCell(Text(conjugation['You']!)),
                        DataCell(Text(conjugation['He/She/It']!)),
                        DataCell(Text(conjugation['We']!)),
                        DataCell(Text(conjugation['They']!)),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Divider(),
            SizedBox(height: 24.h),
            Text(
              'Quiz: Complete the Sentence',
              style: TextStyle(
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Wrap(
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
                labelText: 'Enter your answer',
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
