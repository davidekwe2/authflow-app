import 'package:flutter/material.dart';
class Mybuttons extends StatelessWidget {
  final String text;
  final Function ontap;

  const Mybuttons({super.key,required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,style:  TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2,color: Theme.of(context).colorScheme.secondary
      ),),
      padding: EdgeInsets.only(left: 156,right: 156,top: 20,bottom: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.primary),

    );
  }
}
