import 'package:english/config/colors/colors.dart';
import 'package:english/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../../config/custom_appbar/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home C",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          child: Image.network("https://img.freepik.com/free-vector/hand-drawn-english-book-background_23-2149483336.jpg?t=st=1740724257~exp=1740727857~hmac=ec8e755718f33bde3f15cf2188688d5f3c1672c0e79a9555bef509095abec0e2&w=1060")),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(Icons.star,color: AppColors.primaryColor,),
                            Icon(Icons.star,color: AppColors.primaryColor,),
                            Icon(Icons.star,color: AppColors.primaryColor,),
                            Icon(Icons.star,color: AppColors.primaryColor,),
                            Icon(Icons.star_outline,color: AppColors.primaryColor,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("English Grammar for kids",style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor
                        ),),
                        Row(
                          children: [
                            Text("Time:",style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor
                            ),),
                            Text(" 60 Min",style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade300
                            ),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, RoutesName.partsOfSpeechPage);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(),
                              ),
                              child: Text(
                                "START",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
