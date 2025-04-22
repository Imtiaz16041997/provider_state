import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userpref = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
              InkWell(
                onTap: (){
                  userpref.removeUser().then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });
                },
                child: Text('Logout'),
              )
          ],
        ),
      ),
    );
  }
}
