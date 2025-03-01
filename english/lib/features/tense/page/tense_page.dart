
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/colors/colors.dart';
import '../../../config/custom_appbar/custom_appbar.dart';
import '../data/tense_data.dart';

class TenseScreen extends StatefulWidget {
  const TenseScreen({super.key});

  @override
  TenseScreenState createState() => TenseScreenState();
}

class TenseScreenState extends State<TenseScreen> {


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
      appBar:CustomAppBar(title: "Tense"),
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
