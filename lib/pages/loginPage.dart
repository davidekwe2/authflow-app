import 'package:authflow/mycomponents/mybuttons.dart';
import 'package:authflow/mycomponents/mytextfields.dart';
import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget {
  //to trigger the auth login page
  final void Function()? togglePages;
  const Loginpage({super.key,required this.togglePages});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("LOG-IN",style: TextStyle(fontWeight: FontWeight.bold,),),
      //   elevation: 0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.face_retouching_natural,size: 90,
          color: Theme.of(context).colorScheme.primary,),
          SizedBox(height: 20,),
          Text(
            'THE MIGHTY AUTHENTICATOR',
            style: TextStyle(
                fontSize:20,fontWeight: FontWeight.bold, letterSpacing: 2.5,color: Theme.of(context).colorScheme.primary),),
          SizedBox(height: 20,),
          Container(),
          //name of aoo
          //email textfield
          Mytextfields(
            controller: emailController,
            obscureText: false,
            hintetxt: "Email",
            iconn: Icons.email_rounded,
          ),
          SizedBox(
            height: 25.0,
          ),
          //password textfield
          Mytextfields(controller: passwordController, hintetxt: "Password", obscureText: true,iconn: Icons.lock,),
          //forgot password
          SizedBox(height: 8.0,),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 15),
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),
          //login button
          SizedBox(
            height: 15,
          ),
          Mybuttons(text: "LOGIN",ontap: (){},),
          SizedBox(
            height: 15,
          ),
          //signup
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 15)),
              SizedBox(width: 5.0,),
              GestureDetector(onTap: widget.togglePages,
                  child: Text("Sign Up Here",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 16),
              ))
            ]
          ),
        ],
      ),
    );
  }
}
