import 'package:flutter/material.dart';
import 'package:themovedb/ui/Theme/app_colors.dart';
import 'package:themovedb/ui/navigation/main_navigation.dart';
import 'package:themovedb/ui/widgets/app/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  const MyApp({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const  AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          foregroundColor: Colors.white 
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey
        ),

      ),
      routes: MainNavigation.routes,
      initialRoute: MainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: MainNavigation.onGenerateRoute
    );
  }
}