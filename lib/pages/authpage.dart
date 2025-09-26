import 'package:authflow/pages/signuppage.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';
class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool isLogin=true;
  //toggle between pages
  void togglePages(){
    setState(() {
      isLogin=!isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return Loginpage(
        togglePages: togglePages,
      );
    }
    else{
      return Signuppage(
        togglePages: togglePages,
      );
    }
  }
}
