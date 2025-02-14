
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransitiveVerbScreen extends StatefulWidget {
  const TransitiveVerbScreen({super.key});

  @override
  TransitiveVerbScreenState createState() => TransitiveVerbScreenState();
}

class TransitiveVerbScreenState extends State<TransitiveVerbScreen> {
  final String transitiveVerbDefinition =
      'A transitive verb is an action verb that requires one or more objects to complete its meaning.';

  final String transitiveVerbExample =
      'Example: She **buys** a book. ("book" is the object of the verb "buys")';

  final List<Map<String, String>> transitiveVerbTable = [
    {'verb': 'Buy', 'sentence': 'She buys a book.'},
    {'verb': 'Read', 'sentence': 'He reads a novel.'},
    {'verb': 'Write', 'sentence': 'She writes a letter.'},
    {'verb': 'Play', 'sentence': 'They play football.'},
    {'verb': 'Eat', 'sentence': 'He eats an apple.'},
  ];

  final List<String> transitiveVerbRules = [
    'A transitive verb always requires an object.',
    'Ask "what?" or "whom?" after the verb to find the object.',
    'Without an object, the sentence will not make complete sense.',
    'Example: "She wrote." (Incomplete) vs "She wrote a letter." (Complete)',
  ];

  final Map<String, String> quizQuestions = {
    'Buy': 'She buys ___.',
    'Read': 'He reads ___.',
    'Write': 'She writes ___.',
    'Play': 'They play ___.',
    'Eat': 'He eats ___.',
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
          : 'Please enter an object to complete the sentence!';
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
          "Transitive Verbs",
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
              'Definition of Transitive Verbs:',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(transitiveVerbDefinition),
            Text(transitiveVerbExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Identifying Transitive Verbs:',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: transitiveVerbRules
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
              'Examples of Transitive Verbs:',
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
                rows: transitiveVerbTable
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
                labelText: 'Enter the object',
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
