part of 'auth_page_bloc.dart';

abstract class AuthPageState {
  const AuthPageState();
}

class UserNotAuthenticated extends AuthPageState {
  final AuthPageLabels labels = AuthPageLabels();
}

class UserLoggedIn extends AuthPageState {}

class AuthPageLabels {
  final String email = "EMAIL";
  final String password = "PASSWORD";
  final String submit = "SUBMIT";
}
