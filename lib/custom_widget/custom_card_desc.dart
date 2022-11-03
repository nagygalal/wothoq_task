import 'package:flutter/material.dart';
import 'package:task_app/custom_widget/custom_text.dart';

class CustomCardDesc extends StatelessWidget {
  final String? desc;
  const CustomCardDesc({Key? key,this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
 margin: EdgeInsets.symmetric(vertical: 15.0), 
padding: const EdgeInsets.all(10.0),     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: CustomText(
        text:desc! ,
        size: 18,

      ),
    );
    
  }
}