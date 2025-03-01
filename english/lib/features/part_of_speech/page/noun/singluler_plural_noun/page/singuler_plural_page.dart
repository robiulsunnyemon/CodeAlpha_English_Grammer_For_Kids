import 'package:english/config/colors/colors.dart';
import 'package:english/config/component/next_button.dart';
import 'package:english/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/custom_appbar/custom_appbar.dart';
import '../../../../../../config/theme/theme.dart';
import '../data/singuler_plural_data.dart';

class SingularPluralScreen extends StatefulWidget {
  const SingularPluralScreen({super.key});

  @override
  SingularPluralScreenState createState() => SingularPluralScreenState();
}

class SingularPluralScreenState extends State<SingularPluralScreen> {



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
    final isDarkMode = BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark;
    return Scaffold(
      appBar: CustomAppBar(title: "Singular And Plural Noun"),
      body: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: ListView(
          children: [
            Text(
              'Definition of Singular Noun:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(singularDefinition),
            Text(singularDefinitionExample),
            SizedBox(height: 16.h),
            Text(
              'Definition of Plural Noun:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(pluralDefinition),
            Text(pluralDefinitionExample),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 20.h),
            Text(
              'Singular to Plural Conversion Rules:',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            ...rules.map((rule) {
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
                          rule['rule']!,
                          style:
                              TextStyle(color: Colors.purple, fontSize: 16.sp),
                        ),
                        SizedBox(height: 8.h),
                        Text('Example: ${rule['example']}'),
                      ],
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Singular Plural Table',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('')),
                ],
                rows: nounTableData
                    .map(
                      (noun) => DataRow(
                        cells: [
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(noun['singular']!),
                            ],
                          )),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(noun['plural']!),
                            ],
                          )),
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
              'Quiz: Convert Singular to Plural',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold,color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Singular: ${quizQuestions.keys.elementAt(currentQuestionIndex)}',
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
                labelText: 'Enter Plural Form',
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
                      Navigator.pushNamed(context, RoutesName.countableUncountableNounPage);
                    }),
                  ],
                )
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



