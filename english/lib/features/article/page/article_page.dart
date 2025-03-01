
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/colors/colors.dart';
import '../../../config/component/next_button.dart';
import '../../../config/custom_appbar/custom_appbar.dart';
import '../../../config/routes/routes_name.dart';
import '../article_data.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  ArticleScreenState createState() => ArticleScreenState();
}

class ArticleScreenState extends State<ArticleScreen> {


  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  // Checking if the user answer is correct
  void checkAnswer() {
    setState(() {
      showResult = true;
      String correctAnswer = quizQuestions.values.elementAt(currentQuestionIndex);
      resultMessage = userAnswer.trim().toLowerCase() == correctAnswer
          ? 'Correct! 🎉'
          : 'Incorrect, please try again!';
    });
  }

  // Navigating to the next question
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
      appBar: CustomAppBar(title: "Articles (a, an, the)"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            Text(
              'Definition of Articles:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(articleDefinition),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Examples of Articles:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(articleExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Rules for Articles:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: articleRules
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
              'Examples of Articles Usage:',
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
                    DataColumn(label: Text('Article')),
                    DataColumn(label: Text('Rule')),
                  ],
                  rows: articleTable
                      .map(
                        (example) => DataRow(
                      cells: [
                        DataCell(Text(example['article']!)),
                        DataCell(Text(example['rule']!)),
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
              'Quiz: Choose the Correct Article',
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
                labelText: 'Enter the article (a, an, the)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                userAnswer = value;
              },
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                NextButton(onTap: (){
                  Navigator.pushNamed(context, RoutesName.prepositionPage);
                })
              ],
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
