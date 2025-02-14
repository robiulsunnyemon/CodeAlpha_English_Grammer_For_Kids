import 'package:english/config/colors/colors.dart';
import 'package:english/config/component/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountableUncountableScreen extends StatefulWidget {
  const CountableUncountableScreen({super.key});

  @override
  CountableUncountableScreenState createState() => CountableUncountableScreenState();
}

class CountableUncountableScreenState extends State<CountableUncountableScreen> {
  final String countableDefinition =
      'A countable noun is a noun that can be counted. It has both singular and plural forms.';
  final String countableExample = 'Example: Apple, Car, Dog, Book.';

  final String uncountableDefinition =
      'An uncountable noun is a noun that cannot be counted. It does not have a plural form.';
  final String uncountableExample = 'Example: Water, Sugar, Rice, Information.';

  final List<Map<String, String>> countableUncountableExamples = [
    {'countable': 'Apple', 'uncountable': 'Water'},
    {'countable': 'Car', 'uncountable': 'Music'},
    {'countable': 'Dog', 'uncountable': 'Advice'},
    {'countable': 'Book', 'uncountable': 'Furniture'},
    {'countable': 'Chair', 'uncountable': 'Happiness'},
    {'countable': 'Bottle', 'uncountable': 'Milk'},
    {'countable': 'Pen', 'uncountable': 'Air'},
  ];

  final Map<String, String> quizQuestions = {
    'Apple': 'Countable',
    'Water': 'Uncountable',
    'Car': 'Countable',
    'Sugar': 'Uncountable',
    'Book': 'Countable',
    'Rice': 'Uncountable',
  };

  final List<Map<String, String>> countableUncountableUsage = [
    {'word': 'Many', 'usage': 'Used with countable nouns.', 'example': 'Many books, Many cars'},
    {'word': 'Much', 'usage': 'Used with uncountable nouns.', 'example': 'Much water, Much information'},
    {'word': 'A few', 'usage': 'Used with countable nouns.', 'example': 'A few apples, A few friends'},
    {'word': 'A little', 'usage': 'Used with uncountable nouns.', 'example': 'A little milk, A little patience'},
    {'word': 'Few', 'usage': 'Used with countable nouns, meaning not many.', 'example': 'Few chairs, Few people'},
    {'word': 'Little', 'usage': 'Used with uncountable nouns, meaning not much.', 'example': 'Little sugar, Little money'},
    {'word': 'Some', 'usage': 'Used with both countable and uncountable nouns.', 'example': 'Some apples, Some water'},
    {'word': 'Any', 'usage': 'Used with both countable and uncountable nouns in negative and questions.', 'example': 'Any oranges?, Any salt?'},
  ];

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
          "Countable and Uncountable Nouns",
          style: TextStyle(
              color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: ListView(
          children: [
            Text(
              'Definition of Countable Noun:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(countableDefinition),
            Text(countableExample),
            SizedBox(height: 16.h),
            Text(
              'Definition of Uncountable Noun:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(uncountableDefinition),
            Text(uncountableExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Usage of Many, Much, Few, Little, etc.:',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            ...countableUncountableUsage.map((rule) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0).w,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rule['word']!,
                          style:
                          TextStyle(color: Colors.purple, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        Text('Usage: ${rule['usage']}'),
                        Text('Example: ${rule['example']}'),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Text(
              'Examples of Countable and Uncountable Nouns:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Countable')),
                  DataColumn(label: Text('Uncountable')),
                ],
                rows: countableUncountableExamples
                    .map(
                      (noun) => DataRow(
                    cells: [
                      DataCell(Text(noun['countable']!)),
                      DataCell(Text(noun['uncountable']!)),
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
              'Quiz: Identify Countable and Uncountable Nouns',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Noun: ${quizQuestions.keys.elementAt(currentQuestionIndex)}',
                  style: TextStyle(fontSize: 16.sp),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8).r
                      ),
                      foregroundColor: Colors.purpleAccent,
                      elevation:0

                  ),
                  child: Text('Next Question',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Countable or Uncountable',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                userAnswer = value;
              },
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
                    color: resultMessage.contains('Correct') ? Colors.teal : Colors.red,
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8).r
                    ),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,

                  ),
                  child: Text('Check Answer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NextButton(onTap: (){}),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
