import 'package:flutter/material.dart';
import 'package:themovedb/widgets/main_screen/main_screen.dart';

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
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          centerTitle: true,
          foregroundColor: Colors.white 
        ),
      ),
      routes: {
        '/auth' :(context) => const AuthWidget(),
        '/main_screen':(context) =>const  MainScreen()
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