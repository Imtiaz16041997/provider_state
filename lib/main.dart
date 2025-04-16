import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/container_provider.dart';
import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/view/another_screen.dart';
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
        ChangeNotifierProvider(create: (context) => ContainerProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),),
        home:  AnotherScreen(),
      ),
    );
  }
}


