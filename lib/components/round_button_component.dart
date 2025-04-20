import 'package:flutter/material.dart';

import '../res/colors/colors.dart';

class RoundButtonComponent extends StatelessWidget {
  const RoundButtonComponent(
      {super.key,
        required this.title,
        required this.onPress,
         this.width = 60,
         this.height = 50,
         this.loading = false,
        this.textColor = AppColor.primaryTxtColor,
        this.btnColor = AppColor.primaryBtnColor});

  final bool loading;
  final String title;
  final double height,width;
  final VoidCallback onPress;
  final Color textColor,btnColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: loading? Center(child: CircularProgressIndicator()) : 
        Center(child: Text(title),),
      ),
    );
  }
}
