import 'package:flutter/material.dart';
import 'package:themovedb/ui/widgets/auth/auth_model.dart';
import 'package:themovedb/ui/widgets/auth/auth_wiget.dart';
import 'package:themovedb/ui/widgets/main_screen/main_screen.dart';
import 'package:themovedb/ui/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames{
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}


class MainNavigation {
  static initialRoute(bool isAuth)=> isAuth ?
   MainNavigationRouteNames.mainScreen 
   : MainNavigationRouteNames.auth;
  static final  routes = {
    MainNavigationRouteNames.auth :(context) => NotifierProvider(
      model:AuthModel() ,
      child:const  AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen:(context) =>const  MainScreen(),
      };
  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context)=>MovieDetailsWidget(movieId: movieId)
          );
      default:
        const  widget = Text('Something went wrong');
        return MaterialPageRoute(
          builder: (context)=>widget);
    }
  }
}