import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/additional_details.dart';
import 'package:provider_architecture/ui/views/exercise_completed_view.dart';
import 'package:provider_architecture/ui/views/instructions_view.dart';
import 'package:provider_architecture/ui/views/menu_view.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';
import 'package:provider_architecture/ui/views/rest_view.dart';
import 'package:provider_architecture/ui/views/startworkout_view.dart';
import 'package:provider_architecture/ui/views/workout_view.dart';
import 'package:provider_architecture/ui/views/opening_screen.dart';
import 'views/login_screen.dart';
import 'views/register_screen.dart';
import 'package:provider_architecture/ui/views/bmi_calculator_view.dart';

class Router {
  //static const authLogin = '/auth-login';  //NEW
  //static const authRegister = '/auth-register'; //NEW

  static const OPENING = 'opening-view';
  static const AUTHLOGIN = 'auth-login';
  static const AUTHREGISTER = 'auth-register';
  static const ADDITIONAL = 'additional-details';
  static const BMICALCULATOR = 'bmi-calculator';

  static const ONBOARDING = "onboarding";
  static const MENU = "home";
  static const START = "start";
  static const INSTRUCTIONS = "instructions";
  static const STARTWORKOUT = "startworkout";
  static const WORKOUT = "workout";
  static const REST = "rest";
  static const EXERCISE_COMPLETED = "exercise_completed";

  //static Map<String, WidgetBuilder> define(){ //NEW//////
  //  return{
  //  authLogin: (context)=>Login(),
  //  authRegister: (context)=>Register(),
  //  };
  //}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OPENING:
        return MaterialPageRoute(builder: (_) => OpeningView());
      case AUTHLOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case AUTHREGISTER:
        return MaterialPageRoute(builder: (_) => Register());
      case ADDITIONAL:
        return MaterialPageRoute(builder: (_) => AdditionalDetails());
      case BMICALCULATOR:
        return MaterialPageRoute(builder: (_) => BmiCalculator());
      case ONBOARDING:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case MENU:
        return MaterialPageRoute(builder: (_) => MenuView());
      case INSTRUCTIONS:
        var categoryName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => InstructionsView(categoryName));
      case STARTWORKOUT:
        var categoryName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => StartWorkoutView(categoryName));
      case WORKOUT:
        var arguments = settings.arguments as List<dynamic>;

        return MaterialPageRoute(
            builder: (_) => WorkoutView(arguments[0], arguments[1]));
      case EXERCISE_COMPLETED:
        return MaterialPageRoute(builder: (_) => ExerciseCompleted());
      case REST:
        return MaterialPageRoute(builder: (_) => RestView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

class ScreenArguments {}
