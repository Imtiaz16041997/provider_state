import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/password_visibility_provider.dart';
import 'package:provider_state/utils/routes/routes.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/auth_view_model.dart';
import 'package:provider_state/view_model/user_preferences_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
      ChangeNotifierProvider(create: (context) => PasswordVisibilityProvider()),
      ChangeNotifierProvider(create: (context) => AuthViewModelProvider()),
      ChangeNotifierProvider(create: (context) => UserPreferencesViewModel()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider Login',
      theme: ThemeData(
          primarySwatch: Colors.amber
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    ),
    );
  }
}


