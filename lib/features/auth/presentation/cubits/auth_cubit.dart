// responsible for tsate management
import 'package:authflow/features/auth/domain/models/app_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repostt/authrepos.dart';
import 'auth_states.dart';

class AuthCubith extends Cubit <AuthState>{
  final AuthRepost authRepost;
  AppUser? _currentUser;
  AuthCubith({required this.authRepost}):super(AuthInitial());
  //get current user
  AppUser? get currentUser => _currentUser;
  //CHECK IF USER IS AUTHENTICTED

    void checkAuthStatus() async {
      emit(AuthLoading());
      //get current user
      final AppUser? user = await authRepost.getCurrentUser();
      if (user != null) {
        _currentUser = user;
        emit(AuthSuccess(user));
      } else {
        emit(UnAuthenticated());
      }


  }
//to log in with email and password
  Future<void>login(String email,String password)async {
    try{
      emit(AuthLoading());
      final AppUser? user = await authRepost.signInWithEmailAndPassword(email, password);
      if(user!=null){
        _currentUser=user;
        emit(AuthSuccess(user));
      }
      else{
        emit(AuthError("Login failed"));
      }
    }catch(e){
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
  //to sign up with email and password and full naME
  Future<void>signUp(String Fname,String Lname,String email,String password)async {
    try{
      emit(AuthLoading());
      final AppUser? user = await authRepost.signUpWithEmailAndPassword(Fname, Lname, email, password);
      if(user!=null){
        _currentUser=user;
        emit(AuthSuccess(user));
      }
      else{
        emit(AuthError("Registration failed"));
      }
    }catch(e){
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());

    }
  }
  //LOGOUT METHOD
  Future<void>signOut()async{
    try{
      await authRepost.signOut();
      _currentUser=null;
      emit(UnAuthenticated());
    }
    catch(e){
      emit(AuthError(e.toString()));
    }
  }
  //FORGOT PASSWORD
  Future<String> forgotPassword(String email) async {
    try{
      final message = await authRepost.sendPasswordResetEmail(email);
      return message;
    }catch(e){
      return e.toString();
    }
  }
  //delete account
  Future<void>deleteAccount()async{
    try{
      await authRepost.deleteAccount();
      _currentUser=null;
      emit(UnAuthenticated());
    }
    catch(e){
      emit(AuthError(e.toString()));
    }}


}