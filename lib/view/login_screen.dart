
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/utils/utils.dart';
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
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *1 ;
    //final visibilityProvider = Provider.of<PasswordVisibilityProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.redColor,
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
                SizedBox(height: height * .1,)

              ],
            ),
            SizedBox(height: 40,),


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
