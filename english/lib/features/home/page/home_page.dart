import 'package:english/config/colors/colors.dart';
import 'package:english/config/routes/routes_name.dart';
import 'package:english/features/home/data/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME",style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: HomeData.courseContent.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.prepositionPage);
                  },
                  child: Card(
                    color:  AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        HomeData.courseContent[index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
