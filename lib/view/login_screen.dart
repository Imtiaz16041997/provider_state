
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/components/round_button_component.dart';
import 'package:provider_state/utils/utils.dart';
import 'package:provider_state/view_model/auth_view_model.dart';
import '../provider/password_visibility_provider.dart';
import '../res/colors/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        automaticallyImplyLeading: false,
        title: Text('Login'),
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
                  loading: authViewModel.loading,
                  width: 300,title: 'Login',
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
                    authViewModel.loginApi(data,context);
                        print('api hit');
                  }
                },),
              ],
            ),
          ],
        ),
      ),

    );
  }
}







// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: InkWell(
//           onTap: (){
//             //Utils.snackBar('No Internet Connection', context);
//             //Utils.flushBarErrorMessage('No Internet Connection', context);
//             //Utils.toastMessage('No Internet Connection');
//             Navigator.pushNamed(context, RoutesName.homeScreen);
//             //Navigator.push(context,MaterialPageRoute(builder:(context) => HomeScreen()));
//           },
//           child: Text('Navigate to Next'),
//         ),
//       ),
//     );
//   }
// }
