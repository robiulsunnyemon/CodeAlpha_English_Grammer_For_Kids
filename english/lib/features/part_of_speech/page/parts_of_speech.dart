import 'package:english/config/colors/colors.dart';
import 'package:english/config/component/next_button.dart';
import 'package:english/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/data.dart';



class PartOfSpeechScreen extends StatefulWidget {
   const PartOfSpeechScreen({super.key});

  @override
  State<PartOfSpeechScreen> createState() => _PartOfSpeechScreenState();
}

class _PartOfSpeechScreenState extends State<PartOfSpeechScreen> {
  Map<int, String> selectedAnswers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Part of Speech",style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: partsOfSpeeches.length,
        itemBuilder: (context, index) {
          final part = partsOfSpeeches[index];
          final length = partsOfSpeeches.length;
          return Card(
            elevation: 0,
            margin: EdgeInsets.all(8.0).w,
            child: Padding(
              padding: EdgeInsets.all(16.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(part['title'], style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),),
                  SizedBox(height: 8.0.h),
                  Text(part['definition']),
                  SizedBox(height: 8.0.h),
                  Text("Example: ${part['example']}", style: TextStyle(fontStyle: FontStyle.italic)),
                  SizedBox(height: 8.0.h),
                  Text("Example Sentence: ${part['example_sentence']}"),
                  SizedBox(height: 8.0.h),
                  if (part['rules'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rules:", style: TextStyle(fontWeight: FontWeight.bold)),
                        ...part['rules'].map((rule) => Text("$rule")).toList(),
                      ],
                    ),
                  SizedBox(height: 12.h),
                  if (part['quiz'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quiz:", style: TextStyle(fontWeight: FontWeight.bold)),
                        ...part['quiz'].asMap().entries.map((quizEntry) {
                          int quizIndex = quizEntry.key;
                          var quiz = quizEntry.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(quiz['question']),
                              SizedBox(height: 8.0.h),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: quiz['options'].map<Widget>((option) {
                                    bool isSelected = selectedAnswers[index] == option;
                                    bool isCorrect = option == quiz['answer'];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0).w,
                                      child: ChoiceChip(
                                        label: Text(option, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                                        selected: isSelected,
                                        showCheckmark: false,
                                        selectedColor: isSelected
                                            ? (isCorrect ? Colors.green : Colors.red)
                                            : Colors.grey[300],
                                        onSelected: (selected) {
                                          setState(() {
                                            selectedAnswers[index] = option;
                                          });
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 8.0.h),
                              if (selectedAnswers.containsKey(index))
                                Text(
                                  selectedAnswers[index] == quiz['answer'] ? "Correct!" : "Wrong answer!",
                                  style: TextStyle(
                                    color: selectedAnswers[index] == quiz['answer'] ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  if(index==length-1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButton(onTap: (){
                          Navigator.pushNamed(context, RoutesName.nounPage);
                        }),
                      ],
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
















