import 'dart:async';

import 'package:fitbuddy/back/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final User _user;

  HomePageBloc(this._user) : super(HomePageInitial()) {
    on<LogOutEvent>((event, emit) => _handleLogOut(event, emit));
  }

  Future<void> _handleLogOut(LogOutEvent event, Emitter<HomePageState> emit) async {
    final success = await _user.logout();
    if (success) emit(UserLoggedOut());
  }
}
