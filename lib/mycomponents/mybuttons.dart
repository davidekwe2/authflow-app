import 'package:flutter/material.dart';
class Mybuttons extends StatelessWidget {
  final String text;
  final Function ontap;

  const Mybuttons({super.key,required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("LOGIN",style:  TextStyle(fontSize: 20),),
      padding: EdgeInsets.only(left: 50,right: 50,top: 15,bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).colorScheme.primary),
    );
  }
}
