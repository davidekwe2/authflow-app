import 'package:flutter/material.dart';
class MyGoogleSignInButton extends StatelessWidget {
  //ONTAP
  final VoidCallback? onTap;
  const MyGoogleSignInButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        child: Image.asset("lib/assets/googleicon.png",height: 80,width: 80,),
      ),
    );
  }
}
