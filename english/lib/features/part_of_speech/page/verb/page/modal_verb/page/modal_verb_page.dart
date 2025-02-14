import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalVerbScreen extends StatefulWidget {
  const ModalVerbScreen({super.key});

  @override
  ModalVerbScreenState createState() => ModalVerbScreenState();
}

class ModalVerbScreenState extends State<ModalVerbScreen> {
  final String modalVerbDefinition =
      'A modal verb is a type of auxiliary (helping) verb that expresses ability, possibility, permission, or necessity.';

  final String modalVerbExample =
      'Example: She **can** swim. ("can" shows ability)';

  final List<Map<String, String>> modalVerbTable = [
    {'verb': 'Can', 'sentence': 'She can swim.'},
    {'verb': 'Must', 'sentence': 'You must wear a seatbelt.'},
    {'verb': 'May', 'sentence': 'He may come later.'},
    {'verb': 'Shall', 'sentence': 'We shall go now.'},
    {'verb': 'Should', 'sentence': 'You should study hard.'},
  ];

  final List<String> modalVerbRules = [
    'Modal verbs do not change form (no -s, -ed, or -ing endings).',
    'They are followed by the base form of a verb (without "to").',
    'They do not require auxiliary verbs to form questions or negatives.',
    'Examples: "Can you help?" (Correct) vs "Do you can help?" (Incorrect)',
  ];

  final Map<String, String> quizQuestions = {
    'Can': 'She __ swim.',
    'Must': 'You __ wear a helmet.',
    'May': 'He __ arrive later.',
    'Shall': 'We __ leave now.',
    'Should': 'You __ eat healthy food.',
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
          : 'Please enter a modal verb to complete the sentence!';
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
          "Modal Verbs",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: ListView(
          children: [
            Text(
              'Definition of Modal Verbs:',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(modalVerbDefinition),
            Text(modalVerbExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Using Modal Verbs:',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: modalVerbRules
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
              'Examples of Modal Verbs:',
              style: TextStyle(
                  color: Colors.blueAccent,
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
                rows: modalVerbTable
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
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
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
                labelText: 'Enter the modal verb',
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
