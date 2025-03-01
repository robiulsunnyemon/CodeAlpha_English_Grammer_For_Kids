
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'config/theme/theme.dart';

//Main App
void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ScreenUtilInit(
          designSize: const Size(360, 756),
          minTextAdapt: true,
          splitScreenMode: true,
          builder:  (context , child){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode,
              initialRoute: RoutesName.homeView,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        );
      },
    );
  }
}


