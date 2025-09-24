//outling possible auth ops
import 'package:authflow/features/auth/domain/models/app_user.dart';

abstract class AuthRepost{
  Future<AppUser?> signInWithEmailAndPassword(String email,String password);
  Future<AppUser?> signUpWithEmailAndPassword(String Fname,String Lname,String email,String password);
  Future<void> signOut();
  Future<AppUser?> getCurrentUser();
  Future<bool> isSignedIn();
  Future<void> sendPasswordResetEmail(String email);
    Future<void> deleteAccount();
}