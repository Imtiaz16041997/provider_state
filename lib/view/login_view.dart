
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/auth_login_provider.dart';

import '../provider/password_visibility_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final visibilityProvider = Provider.of<PasswordVisibilityProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            Consumer<PasswordVisibilityProvider>(
              builder: (context, visibilityProvider, child) {
                return TextFormField(
                  obscureText: !visibilityProvider.isVisible,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffix: InkWell(
                      onTap: () {
                        visibilityProvider.toggleVisibility();
                      },
                      child: Icon(
                        visibilityProvider.isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
           /*ValueListenableBuilder(valueListenable: toggle, builder: (context,value,child){
           return  TextFormField(
               obscureText: toggle.value,
               controller: passwordController,
               decoration: InputDecoration(
                 hintText: 'Password',
                 suffix: InkWell(
                   onTap: (){
                     toggle.value = !toggle.value;
                   },
                     child: Icon(toggle.value ? Icons.visibility_off_outlined : Icons.visibility)),
                 border: OutlineInputBorder(),
               ),
             );
           }),*/
            SizedBox(height: 50,),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: authProvider.loading ?CircularProgressIndicator(color: Colors.white,)  : Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
