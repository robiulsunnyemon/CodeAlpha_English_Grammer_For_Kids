// Reusable AppBar Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors/colors.dart';
import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppColors.primaryColor,
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_sharp),
      ),
      actions: [
        IconButton(
          icon: Icon(BlocProvider.of<ThemeCubit>(context).state == ThemeMode.light
              ? Icons.dark_mode
              : Icons.light_mode),
          onPressed: () {
            BlocProvider.of<ThemeCubit>(context).toggleTheme();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}