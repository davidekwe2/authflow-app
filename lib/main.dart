import 'package:authflow/features/auth/data/firebase_auth_repo.dart';
import 'package:authflow/features/auth/presentation/cubits/auth_states.dart';
import 'package:authflow/firebase_options.dart';
import 'package:authflow/pages/authpage.dart';
import 'package:authflow/pages/homePage.dart';
import 'package:authflow/themes/darkmode.dart';
import 'package:authflow/themes/lightmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authflow/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  //firebasesetup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // auth repo
  final  firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      //provide cubits to app
      //authcubit
      BlocProvider<AuthCubith>(
        create: (context) => AuthCubith(authRepost: firebaseAuthRepo)..checkAuthStatus(),
      ),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,        // note: lowercase if your var is lightmode
      darkTheme: darkMode,
      home: BlocConsumer<AuthCubith,AuthState>(
          builder: (context,state){
            print(state.toString());

            //unauthenticated-> authpage
            if(state is UnAuthenticated){
              return Authpage();
            }
            //authenticated->homepage
            else if(state is AuthSuccess){
              return Homepage();
            }

            //loading...
            else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),);
            }
            },


          listener: (context,state){
            //listen for State changes
            //if state is in error mode
            if(state is AuthError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }

          }),
    ),
    );
  }
}