//FIREBASE IS BACKEND
import 'package:authflow/features/auth/domain/repostt/authrepos.dart';
import 'package:authflow/features/auth/domain/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authflow/features/auth/presentation/cubits/auth_cubit.dart';


import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_auth_repo.dart';

class FirebaseAuthRepo implements AuthRepost{
  //acccedd firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //to sign in with email and password

  @override
  Future<AppUser?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      //create user
      AppUser user = AppUser(userid: userCredential.user!.uid, email: userCredential.user!.email!);
      return user;
    }
        catch(e){
      throw Exception("Login failed");
        }
  }
  @override
  Future<AppUser?> signUpWithEmailAndPassword(String Fname, String Lname, String email, String password) async{
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      //create user
      AppUser user = AppUser(userid: userCredential.user!.uid, email: userCredential.user!.email!);
      return user;
    }
        catch(e){
      throw Exception("Registration failed");
        }
  }


  @override
  Future<AppUser?> getCurrentUser() async{
    try{
      final user=firebaseAuth.currentUser;//current user
      //no user logged in
      if(user==null){
        return null;
      }
      //user logged in
      AppUser appUser = AppUser(userid: user.uid, email: user.email!);
      return appUser;
    }
        catch(e){
      throw Exception("Failed to get current user");
        }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      // Get the current Firebase user
      final user = firebaseAuth.currentUser;
      // If the user object is not null, the user is signed in.
      return user != null; // This will return true if user exists, false otherwise
    } catch (e) {
      print("Error checking sign-in status: $e");
      throw Exception("Failed to check if user is signed in");
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async{
//to reset password
  try{
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return "PASSWORD EMAIL RESET, SENT TO YOUR EMAIL";
  }
      catch(e){throw Exception(e);}
  }
//sign in with google


  @override
  Future<void> signOut() async{
    firebaseAuth.signOut();
  }



  @override
  Future<AppUser?> signInWithGoogle() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize();

      GoogleSignInAccount account;
      if (signIn.supportsAuthenticate()) {
        account = await signIn.authenticate(scopeHint: const ['email']);
      } else {
        final GoogleSignInAccount? maybe =
        await signIn.attemptLightweightAuthentication();
        if (maybe == null) return null; // not supported or no previous session
        account = maybe;
      }

      final String? idToken = (await account.authentication).idToken;
      if (idToken == null) throw Exception('No ID token from Google');

      final OAuthCredential credential =
      GoogleAuthProvider.credential(idToken: idToken);

      final UserCredential userCred =
      await firebaseAuth.signInWithCredential(credential);

      final user = userCred.user;
      if (user == null) return null;

      return AppUser(userid: user.uid, email: user.email!);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      throw Exception('Google Sign-In failed: ${e.code.name}');
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }


  @override
  Future<void> deleteAccount() {
    //delete account
    try{
      final user=firebaseAuth.currentUser;
      if(user!=null){
        return user.delete();
      }else{
        throw Exception("No user logged in");
      }
    }catch(e){throw Exception("Failed to delete account");
  }}
  }

