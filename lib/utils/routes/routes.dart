

// import 'dart:js';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view/home_scree.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

        case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      
      case RoutesNames.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(child: Text('no route Defined')),
          );
        });
    }

  }

}