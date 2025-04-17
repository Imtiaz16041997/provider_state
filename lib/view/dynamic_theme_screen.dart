
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dynamic_theme_provider.dart';

class DynamicThemeScreen extends StatefulWidget {
  const DynamicThemeScreen({super.key});

  @override
  State<DynamicThemeScreen> createState() => _DynamicThemeScreenState();
}

class _DynamicThemeScreenState extends State<DynamicThemeScreen> {

  @override
  Widget build(BuildContext context) {
    print('build');
    final themeChanger = Provider.of<DynamicThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Theme'),
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.favorite),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
             title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),

          RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),



        ],
      ),
    );
  }
}
