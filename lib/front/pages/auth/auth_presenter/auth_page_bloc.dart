import 'package:equatable/equatable.dart';
import 'package:fitbuddy/back/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_page_event.dart';

part 'auth_page_state.dart';

class AuthPagePresenter extends Bloc<AuthPageEvent, AuthPageState> {
  final User _user;

  AuthPagePresenter(this._user) : super(UserNotAuthenticated()) {
    on<LogInEvent>((event, emit) => _logIn(event, emit));
  }

  _logIn(LogInEvent event, Emitter<AuthPageState> emit) async {
    var success = await _user.login(event.email, event.password);
    if (success) {
      emit(UserLoggedIn());
    }
  }
}
