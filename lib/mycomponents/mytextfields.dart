import 'package:flutter/material.dart';
class Mytextfields extends StatelessWidget {
  final TextEditingController controller;
  final String hintetxt;
  final bool obscureText;
  final IconData? iconn;
  const Mytextfields({super.key,required this.controller,required this.hintetxt,required this.obscureText,this.iconn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(

          prefixIcon: Icon(iconn,color: Theme.of(context).colorScheme.primary,),
          hintText: hintetxt,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),),),

      ),
    );
  }
}
