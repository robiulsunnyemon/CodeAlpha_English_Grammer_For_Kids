

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/colors/colors.dart';

class TenseScreen extends StatefulWidget {
  const TenseScreen({super.key});

  @override
  TenseScreenState createState() => TenseScreenState();
}

class TenseScreenState extends State<TenseScreen> {
  final String tenseDefinition =
      'Tense refers to the time of an action or event, expressed by the verb.';

  final List<Map<String, String>> tenseTypes = [
    {'type': 'Present Simple', 'example': 'He plays football every day.'},
    {'type': 'Present Continuous', 'example': 'He is playing football now.'},
    {'type': 'Present Perfect', 'example': 'He has played football before.'},
    {
      'type': 'Present Perfect Continuous',
      'example': 'He has been playing football for an hour.'
    },
    {'type': 'Past Simple', 'example': 'He played football yesterday.'},
    {
      'type': 'Past Continuous',
      'example': 'He was playing football when I called him.'
    },
    {
      'type': 'Past Perfect',
      'example': 'He had played football before he went home.'
    },
    {
      'type': 'Past Perfect Continuous',
      'example':
          'He had been playing football for two hours before the rain started.'
    },
    {'type': 'Future Simple', 'example': 'He will play football tomorrow.'},
    {
      'type': 'Future Continuous',
      'example': 'He will be playing football at this time tomorrow.'
    },
    {
      'type': 'Future Perfect',
      'example': 'He will have played football by noon.'
    },
    {
      'type': 'Future Perfect Continuous',
      'example':
          'He will have been playing football for three hours by the time you arrive.'
    },
  ];

  final List<String> tenseRules = [
    'Tenses indicate the time of an action.',
    'Each tense has four forms: Simple, Continuous, Perfect, and Perfect Continuous.',
    'Present tense is used for current or habitual actions.',
    'Past tense is used for actions that happened before now.',
    'Future tense is used for actions that will happen later.',
  ];

  final Map<String, List<Map<String, String>>> tenseForms = {
    'Present Tense': [
      {'type': 'Simple Present', 'structure': 'Subject + V1 + Object', 'example': 'She writes a letter.'},
      {'type': 'Present Continuous', 'structure': 'Subject + is/am/are + V1+ing + Object', 'example': 'She is writing a letter.'},
      {'type': 'Present Perfect', 'structure': 'Subject + has/have + V3 + Object', 'example': 'She has written a letter.'},
      {'type': 'Present Perfect Continuous', 'structure': 'Subject + has/have been + V1+ing + Object', 'example': 'She has been writing a letter.'},
    ],
    'Past Tense': [
      {'type': 'Simple Past', 'structure': 'Subject + V2 + Object', 'example': 'She wrote a letter.'},
      {'type': 'Past Continuous', 'structure': 'Subject + was/were + V1+ing + Object', 'example': 'She was writing a letter.'},
      {'type': 'Past Perfect', 'structure': 'Subject + had + V3 + Object', 'example': 'She had written a letter.'},
      {'type': 'Past Perfect Continuous', 'structure': 'Subject + had been + V1+ing + Object', 'example': 'She had been writing a letter.'},
    ],
    'Future Tense': [
      {'type': 'Simple Future', 'structure': 'Subject + will + V1 + Object', 'example': 'She will write a letter.'},
      {'type': 'Future Continuous', 'structure': 'Subject + will be + V1+ing + Object', 'example': 'She will be writing a letter.'},
      {'type': 'Future Perfect', 'structure': 'Subject + will have + V3 + Object', 'example': 'She will have written a letter.'},
      {'type': 'Future Perfect Continuous', 'structure': 'Subject + will have been + V1+ing + Object', 'example': 'She will have been writing a letter.'},
    ],
  };

  final List<Map<String, String>> quizQuestions = [
    {'question': 'Simple Present: She ___ (write) a letter.', 'answer': 'writes'},
    {'question': 'Present Continuous: She ___ (write) a letter now.', 'answer': 'is writing'},
    {'question': 'Present Perfect: She ___ (write) a letter.', 'answer': 'has written'},
    {'question': 'Simple Past: She ___ (write) a letter yesterday.', 'answer': 'wrote'},
    {'question': 'Past Continuous: She ___ (write) a letter when I arrived.', 'answer': 'was writing'},
    {'question': 'Simple Future: She ___ (write) a letter tomorrow.', 'answer': 'will write'},
  ];

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    setState(() {
      showResult = true;
      resultMessage = userAnswer.trim().toLowerCase() ==
              quizQuestions[currentQuestionIndex]['answer']!.toLowerCase()
          ? 'Correct! 🎉'
          : 'Incorrect. Try again!';
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
          "Tense",
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
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Definition of Tense:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(tenseDefinition),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Tense:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tenseRules
                    .map((rule) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                          child: Text(rule),
                        ))
                    .toList(),
              ),
            ),
            ...tenseForms.entries.map((entry) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,), 
                Text(
                  entry.key,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8).w,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Structure')),
                        DataColumn(label: Text('Example')),
                      ],
                      rows: entry.value
                          .map(
                            (example) => DataRow(
                          cells: [
                            DataCell(Text(example['type']!)),
                            DataCell(Text(example['structure']!)),
                            DataCell(Text(example['example']!)),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(),
                SizedBox(height: 20.h),
              ],
            )),
            SizedBox(height: 20.h),
            Text(
              'Examples of Tenses:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2).w,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Example')),
                  ],
                  rows: tenseTypes
                      .map(
                        (example) => DataRow(
                          cells: [
                            DataCell(Text(example['type']!)),
                            DataCell(Text(example['example']!)),
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
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Wrap(
              children: [
                Text(
                  quizQuestions[currentQuestionIndex]['question']!,
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the answer',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  userAnswer = value;
                });
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
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
