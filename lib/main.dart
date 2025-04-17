import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/container_provider.dart';
import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/provider/dynamic_theme_provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';
import 'package:provider_state/view/another_screen.dart';
import 'package:provider_state/view/dynamic_theme_screen.dart';
import 'package:provider_state/view/favourite_screen.dart';
import 'package:provider_state/view/home_view.dart';

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
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => ContainerProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => DynamicThemeChangerProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<DynamicThemeChangerProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(
            backgroundColor: Colors.purple,
            actionsIconTheme: IconThemeData(color: Colors.red),
            ),
          ),
          darkTheme: ThemeData(
              useMaterial3: false,
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
              actionsIconTheme: IconThemeData(color: Colors.purple),
            ),
          ),
          home:  DynamicThemeScreen(),
        );
      }),
      
    );
  }
}


