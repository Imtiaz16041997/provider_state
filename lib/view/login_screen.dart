import 'package:flutter/material.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            //Utils.snackBar('No Internet Connection', context);
            //Utils.flushBarErrorMessage('No Internet Connection', context);
            //Utils.toastMessage('No Internet Connection');
            Navigator.pushNamed(context, RoutesName.homeScreen);
            //Navigator.push(context,MaterialPageRoute(builder:(context) => HomeScreen()));
          },
          child: Text('Navigate to Next'),
        ),
      ),
    );
  }
}
