import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors/colors.dart';

class DegreeScreen extends StatefulWidget {
  const DegreeScreen({super.key});

  @override
  DegreeScreenState createState() => DegreeScreenState();
}

class DegreeScreenState extends State<DegreeScreen> {
  final String degreeDefinition =
      'Degrees of Comparison are used to compare one thing with another.';

  final String degreeExample =
      'Example: Positive - Tall, Comparative - Taller, Superlative - Tallest.';

  final List<Map<String, String>> degreeTable = [
    {'positive': 'Tall', 'comparative': 'Taller', 'superlative': 'Tallest'},
    {'positive': 'Small', 'comparative': 'Smaller', 'superlative': 'Smallest'},
    {'positive': 'Good', 'comparative': 'Better', 'superlative': 'Best'},
    {'positive': 'Bad', 'comparative': 'Worse', 'superlative': 'Worst'},
    {
      'positive': 'Beautiful',
      'comparative': 'More Beautiful',
      'superlative': 'Most Beautiful'
    },
  ];

  final List<String> degreeRules = [
    '1. For most one-syllable adjectives, add -er for comparative and -est for superlative. (e.g., Tall → Taller → Tallest)',
    '2. If the adjective ends in -e, just add -r for comparative and -st for superlative. (e.g., Large → Larger → Largest)',
    '3. If the adjective ends in a single consonant preceded by a single vowel, double the consonant before adding -er or -est. (e.g., Big → Bigger → Biggest)',
    '4. For adjectives with two or more syllables, use "more" for comparative and "most" for superlative. (e.g., Beautiful → More Beautiful → Most Beautiful)',
    '5. Some adjectives have irregular forms. (e.g., Good → Better → Best, Bad → Worse → Worst)',
  ];

  final Map<String, String> quizQuestions = {
    'Tall': 'Taller',
    'Good': 'Better',
    'Bad': 'Worse',
    'Beautiful': 'More Beautiful',
    'Small': 'Smaller',
  };

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    String correctAnswer = quizQuestions.values.elementAt(currentQuestionIndex);
    setState(() {
      showResult = true;
      if (userAnswer.trim().toLowerCase() == correctAnswer.toLowerCase()) {
        resultMessage = 'Correct! 🎉';
      } else {
        resultMessage = 'Incorrect! Correct answer: $correctAnswer';
      }
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
          "Degrees of Comparison",
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
              'Definition of Degrees of Comparison:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(degreeDefinition),
            Text(degreeExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Conversion of Degree:',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            ...degreeRules.map((rule) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0).w,
                  child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(' $rule'),
                      ),
                  ),
                )),
            SizedBox(height: 24.h),
            Divider(),
            Text(
              'Degrees of Comparison Table:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 290.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2).w,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Positive')),
                        DataColumn(label: Text('Comparative')),
                        DataColumn(label: Text('Superlative')),
                      ],
                      rows: degreeTable
                          .map(
                            (degree) => DataRow(
                              cells: [
                                DataCell(Text(degree['positive']!)),
                                DataCell(Text(degree['comparative']!)),
                                DataCell(Text(degree['superlative']!)),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Divider(),
            SizedBox(height: 24.h),
            Text(
              'Quiz: Convert to Comparative Degree',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Positive: ${quizQuestions.keys.elementAt(currentQuestionIndex)}',
                  style: TextStyle(fontSize: 16.sp),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8).r),
                    foregroundColor: Colors.purpleAccent,
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
                labelText: 'Enter Comparative Form',
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
