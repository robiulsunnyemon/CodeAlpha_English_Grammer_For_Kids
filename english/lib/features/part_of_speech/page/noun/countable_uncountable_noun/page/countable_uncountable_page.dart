import 'package:english/config/colors/colors.dart';
import 'package:english/config/component/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/custom_appbar/custom_appbar.dart';
import '../../../../../../config/routes/routes_name.dart';
import '../data/countable_uncountable_data.dart';

class CountableUncountableScreen extends StatefulWidget {
  const CountableUncountableScreen({super.key});

  @override
  CountableUncountableScreenState createState() => CountableUncountableScreenState();
}

class CountableUncountableScreenState extends State<CountableUncountableScreen> {


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
      appBar:CustomAppBar(title: "Countable and Uncountable Nouns"),
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
                    NextButton(onTap: (){
                      Navigator.pushNamed(context, RoutesName.pronounPage);
                    }),
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
