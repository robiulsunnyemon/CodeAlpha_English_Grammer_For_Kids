import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/colors/colors.dart';
import '../../../config/component/next_button.dart';
import '../../../config/custom_appbar/custom_appbar.dart';
import '../../../config/routes/routes_name.dart';
import '../data/subject_verb_agreement.dart';

class SubjectVerbAgreementScreen extends StatefulWidget {
  const SubjectVerbAgreementScreen({super.key});

  @override
  SubjectVerbAgreementScreenState createState() => SubjectVerbAgreementScreenState();
}

class SubjectVerbAgreementScreenState extends State<SubjectVerbAgreementScreen> {


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
      appBar: CustomAppBar(title: "Subject Verb Agreement"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            Text(
              'Definition of Subject-Verb Agreement:',
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
              'Rules for Subject-Verb Agreement:',
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
              'Examples of Subject-Verb Agreement:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Subject')),
                  DataColumn(label: Text('Verb')),
                ],
                rows: agreementTable
                    .map(
                      (example) => DataRow(
                    cells: [
                      DataCell(Text(example['subject']!)),
                      DataCell(Text(example['verb']!)),
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
                  fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
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
                labelText: 'Enter your answer',
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
                  Navigator.pushNamed(context, RoutesName.adverbPage);
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
