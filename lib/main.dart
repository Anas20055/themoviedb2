import 'package:flutter/material.dart';
import 'package:themovedb/Theme/app_colors.dart';
import 'package:themovedb/widgets/auth/auth_model.dart';
import 'package:themovedb/widgets/main_screen/main_screen.dart';
import 'package:themovedb/widgets/movie_details/movie_details_widget.dart';

import 'widgets/auth/auth_wiget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      routes: {
        '/auth' :(context) => AuthProvider(
          model:AuthModel() ,
          child:const  AuthWidget(),
          ),
        '/main_screen':(context) =>const  MainScreen(),
        '/main_screen/movie_details':(context){
          final  id = ModalRoute.of(context)?.settings.arguments;
          if(id is int){
            return MovieDetailsWidget(movieId: id,);
          }else{
          return const MovieDetailsWidget(movieId: 0,);
          }
          }
      },
      initialRoute: '/auth',
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context)=>
        const Scaffold(
          body: Center(child: Text('Something went wrong')),
            )
          ),
    );
  }
}