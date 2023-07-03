import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medreminder/Reminder/ui/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: yellowColor,
        ),
        child: Align (
        alignment: Alignment.center,
        child:Text(
          label,
          style: TextStyle(
            color:Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      ),
    );
  }
}