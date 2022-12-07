part of 'auth_page_bloc.dart';

abstract class AuthPageEvent extends Equatable {
  const AuthPageEvent();

  @override
  List<Object?> get props => [];
}

class LogInEvent extends AuthPageEvent {
  final String email;
  final String password;

  const LogInEvent({required this.email, required this.password});
}
