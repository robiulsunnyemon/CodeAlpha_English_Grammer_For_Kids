
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/colors/colors.dart';
import '../../../../../config/component/next_button.dart';
import '../../../../../config/custom_appbar/custom_appbar.dart';
import '../../../../../config/routes/routes_name.dart';
import '../../../../../config/theme/theme.dart';
import '../data/conjunction_data.dart';

class ConjunctionPage extends StatefulWidget {
  const ConjunctionPage({super.key});

  @override
  State<ConjunctionPage> createState() => ConjunctionPageState();
}

class ConjunctionPageState extends State<ConjunctionPage> {


  Map<int, String> selectedAnswers = {};
  @override
  Widget build(BuildContext context) {
    final isDarkMode = BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark;
    return Scaffold(
      appBar: CustomAppBar(title: "Conjunction"),
      body: ListView.builder(
        itemCount: kindsOfConjunction.length,
        itemBuilder: (context, index) {
          final verb = kindsOfConjunction[index];
          final length = kindsOfConjunction.length;
          return Card(
            margin: EdgeInsets.all(8.0).w,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(12.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    verb['title'],
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  Text(
                    verb['definition'],
                  ),
                  SizedBox(height: 8.0.h),
                  Text(
                    "Examples: ${verb['example']}",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 8.0.h),
                  const Text(
                    "Sentences:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...verb['sentences'].map<Widget>((sentence) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0).w,
                      child: RichText(
                        text: TextSpan(
                          style:  TextStyle(
                              color:isDarkMode?Colors.white: Color.fromRGBO(29, 27, 32, 1.0)),
                          children: _getHighlightedSentence(sentence),
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 12.0.h),
                  if (verb['quiz'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quiz:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ...verb['quiz'].asMap().entries.map((quizEntry) {
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
                                  children:
                                  quiz['options'].map<Widget>((option) {
                                    bool isSelected =
                                        selectedAnswers[index] == option;
                                    bool isCorrect = option == quiz['answer'];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0)
                                          .w,
                                      child: ChoiceChip(
                                        label: Text(option,
                                            style: TextStyle(
                                                color: isSelected || isDarkMode
                                                    ? Colors.white
                                                    : Colors.black)),
                                        selected: isSelected,
                                        showCheckmark: false,
                                        selectedColor: isSelected
                                            ? (isCorrect
                                            ? Colors.green
                                            : Colors.red)
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
                                  selectedAnswers[index] == quiz['answer']
                                      ? "Correct!"
                                      : "Wrong answer!",
                                  style: TextStyle(
                                    color:
                                    selectedAnswers[index] == quiz['answer']
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  if (index == length - 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButton(onTap: () {
                          Navigator.pushNamed(context, RoutesName.phrasePage);
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

  List<TextSpan> _getHighlightedSentence(String sentence) {
    final RegExp regex = RegExp(r'\*(.*?)\*');
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in regex.allMatches(sentence)) {
      if (match.start > lastMatchEnd) {
        spans
            .add(TextSpan(text: sentence.substring(lastMatchEnd, match.start)));
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      );
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < sentence.length) {
      spans.add(TextSpan(text: sentence.substring(lastMatchEnd)));
    }

    return spans;
  }
}
