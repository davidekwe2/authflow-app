import 'package:authflow/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:authflow/mycomponents/mybuttons.dart';
import 'package:authflow/mycomponents/mytextfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Signuppage extends StatefulWidget {
  final void Function()? togglePages;
  const Signuppage({super.key,required this.togglePages});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmpasswordController=TextEditingController();
  final nameController=TextEditingController();
  final surnameController=TextEditingController();

  //Sign up button pressed
  void signUp(){
    //prepare info needed
    final String email=emailController.text;
    final String password=passwordController.text;
    final String confirmpassword=confirmpasswordController.text;
    final String name=nameController.text;
    final String surname=surnameController.text;

    //auth cubit
    final authCubith = context.read<AuthCubith>();
    //CHECK AND ensure that fields arent empty
    if(email.isNotEmpty && password.isNotEmpty && confirmpassword.isNotEmpty && name.isNotEmpty && surname.isNotEmpty){
      //check if passwords match
      if(password==confirmpassword){
        //sign up
        authCubith.signUp(name, surname, email, password);
      }
      //PASSWORD DONT MATCH
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      }
      //IF FIELDS ARE EMPTY
      }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill in all fields!!!")));


    }

  }

  @override
  //dispose controllers
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.how_to_reg,size: 90,
            color: Theme.of(context).colorScheme.primary,),
          SizedBox(height: 20,),
          Text(
            'THE MIGHTY AUTHENTICATOR',
            style: TextStyle(
                fontSize:20,fontWeight: FontWeight.bold, letterSpacing: 2.5,color: Theme.of(context).colorScheme.primary),),
          SizedBox(height: 20,),
          Container(),
          //name of user
          Mytextfields(
            controller: nameController,
            obscureText: false,
            hintetxt: "First Name",
          ),
          SizedBox(
            height: 25.0,
          ),
          //last name of user
          Mytextfields(
            controller: surnameController,
            obscureText: false,
            hintetxt: "Last Name",
          ),
          SizedBox(
            height: 25.0,
          ),

          //email textfield
          Mytextfields(
            controller: emailController,
            obscureText: false,
            hintetxt: "Email",
          ),
          SizedBox(
            height: 25.0,
          ),
          //password textfield
          Mytextfields(controller: passwordController, hintetxt: "Password", obscureText: true,),
          SizedBox(
            height: 25.0,
          ),
          //Confirm password textfield
          Mytextfields(controller: confirmpasswordController, hintetxt: "Confirm Password", obscureText: true,),

          //sign up button
          SizedBox(
            height: 15,
          ),
          Mybuttons(text: "SIGN UP",ontap: signUp,),
          SizedBox(
            height: 15,
          ),
          //signin
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 15)),
                SizedBox(width: 5.0,),
                GestureDetector(onTap: widget.togglePages,
                    child: Text("Sign In Now",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 16),))
              ]
          ),
        ],
      ),
    );
  }
}

