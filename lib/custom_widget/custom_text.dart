// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Alignment alignment;
  final TextDecoration decoration;
  const CustomText({Key? key,
  this.text='',
  this.color=Colors.black,
  this.size=16.0,
  this.decoration=TextDecoration.none,
  this.alignment=Alignment.topLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,style: TextStyle(color: color,fontSize: size,decoration:decoration),),
    );
  }
}