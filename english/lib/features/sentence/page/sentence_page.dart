
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors/colors.dart';
import '../../../config/component/next_button.dart';
import '../../../config/custom_appbar/custom_appbar.dart';
import '../../../config/routes/routes_name.dart';
import '../data/sentence_data.dart';

class SentenceScreen extends StatefulWidget {
  const SentenceScreen({super.key});

  @override
  SentenceScreenState createState() => SentenceScreenState();
}

class SentenceScreenState extends State<SentenceScreen> {


  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showResult = false;
  String resultMessage = '';

  void checkAnswer() {
    setState(() {
      showResult = true;
      String correctAnswer = quizQuestions.values.elementAt(currentQuestionIndex);
      resultMessage = userAnswer.trim().toLowerCase() == correctAnswer
          ? 'Correct! 🎉'
          : 'Incorrect, please try again!';
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
      appBar: CustomAppBar(title: "Interjection"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            Text(
              'Definition of Sentence:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(sentenceDefinition),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Types of Sentences:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceTypes
                    .map((type) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(type),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Parts of a Sentence:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceParts
                    .map((part) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(part),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Sentence Structures:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceStructures
                    .map((structure) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text(structure),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Examples of Sentence Types:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sentenceExamples.entries
                    .map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0).h,
                  child: Text('${entry.key}: ${entry.value}'),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
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
                labelText: 'Enter the missing word',
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
                  Navigator.pushNamed(context, RoutesName.tensePage);
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
