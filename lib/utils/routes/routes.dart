import 'package:flutter/material.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view/home_screen.dart';
import 'package:provider_state/view/login_screen.dart';
import 'package:provider_state/view/sign_up_screen.dart';
import 'package:provider_state/view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) => SplashScreen(),
        );


      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );

      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );

      case RoutesName.signUpScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen(),
        );


      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
