
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  double? width ;
  VoidCallback? onPress;
  String? buttonName ;


   CustomTextButton({this.width , this.buttonName , this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue),
      width: width,
      height: 80,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          buttonName!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
