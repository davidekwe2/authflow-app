import 'package:authflow/mycomponents/appleSignInButton.dart';
import 'package:authflow/mycomponents/gsignbutton.dart';
import 'package:authflow/mycomponents/mybuttons.dart';
import 'package:authflow/mycomponents/mytextfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/cubits/auth_cubit.dart';
class Loginpage extends StatefulWidget {
  //to trigger the auth login page
  final void Function()? togglePages;
  const Loginpage({super.key,required this.togglePages});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
void login(){
  final String email = emailController.text.trim();
  final String password = passwordController.text.trim();

  final authCubith = context.read<AuthCubith>();

  // More permissive email validation
  final emailRegex =
  RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields!!!")),
    );
    return;
  }

  if (!emailRegex.hasMatch(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please enter a valid email address")),
    );
    return;
  }

  authCubith.login(email, password);
}
//forgot password dialog box
void openforgotPassword(){
  showDialog(context: context,
      builder: (context)=>AlertDialog(
        title: Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
          content: Mytextfields(controller: emailController, hintetxt: "Please enter your e-mail", obscureText: false, iconn: Icons.email_rounded,),
        actions: [
          //cancel button
          TextButton(onPressed: ()=>Navigator.pop(context),
              child: Text("Cancel",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),)),
          //Reset button
          TextButton(
            onPressed: () async{
              String message = await context.read<AuthCubith>().forgotPassword(emailController.text.trim());
              if(message=="PASSWORD EMAIL RESET, SENT TO YOUR EMAIL"){
                Navigator.pop(context);
                emailController.clear();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
              child: Text("Reset",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),)
          )
        ]
      )
  );
}
  @override
  //dispose controllers
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("LOG-IN",style: TextStyle(fontWeight: FontWeight.bold,),),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
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
                    GestureDetector(onTap: openforgotPassword,
                      child: Text("Forgot Password?",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),
                    SizedBox(width: 30.0,),
                  ],
                ),
              ),
              //login button
              SizedBox(
                height: 15,
              ),
              Mybuttons(text: "LOGIN",ontap: login,),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR SIGN IN WITH",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 18),
                  ),),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                //to insert the two images google and apple
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyGoogleSignInButton(
                    onTap: () async {
                      final authCubit = context.read<AuthCubith>();   // get cubit
                      final user = await authCubit.signInWithGoogle(); // call method
                      if (user != null) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    },
                  ),
                  SizedBox(width: 20.0,),
                  // AppleSignInButton(),
                  AppleSignInButton(),
                ]
              ),
              SizedBox(
                height: 30,
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
        ),
      ),
    );
  }
}
