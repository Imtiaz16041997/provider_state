import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/round_button_component.dart';
import '../provider/password_visibility_provider.dart';
import '../res/colors/colors.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModelProvider>(context);
    final height = MediaQuery.of(context).size.height *1 ;
    //final visibilityProvider = Provider.of<PasswordVisibilityProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBtnColor,
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  focusNode: emailFocusNode,
                  validator: (value){
                    if(value!.isEmpty){
                      Utils.snackBar('Enter Email', context);
                    }
                  },
                  onFieldSubmitted: (value){
                    Utils.filedFocusChange(context, emailFocusNode, passwordFocusNode);
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                Consumer<PasswordVisibilityProvider>(
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: !value.isVisible,
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: const OutlineInputBorder(),
                        suffix: InkWell(
                          onTap: () {
                            value.toggleVisibility();
                          },
                          child: Icon(
                            value.isVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: height * .085,),
                RoundButtonComponent(
                  loading: authViewModel.signUpLoading,
                  width: 300,title: 'Sign Up',
                  onPress: () {
                    if(_emailController.text.isEmpty){
                      Utils.flushBarErrorMessage('Please Enter email', context);
                    }else if(_passwordController.text.isEmpty){
                      Utils.flushBarErrorMessage('Please Enter password', context);
                    }
                    else if(_passwordController.text.length < 6){
                      Utils.flushBarErrorMessage('Please Enter 6 digit password', context);
                    } else {
                      Map data = {
                        'email' : _emailController.text.toString(),
                        'password' : _passwordController.text.toString()
                      };
                      authViewModel.signUpApi(data,context);
                      print('api hit');
                    }
                  },),
                SizedBox(height: height * .02,),
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  },
                  child: Text("Already have an account? Login"),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}

