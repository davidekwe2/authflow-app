//list of states when a user is trying to authenticate
import 'package:authflow/features/auth/domain/models/app_user.dart';

abstract class AuthState{}
class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{
  final AppUser user;
  AuthSuccess(this.user);
}
class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}
class UnAuthenticated extends AuthState{}