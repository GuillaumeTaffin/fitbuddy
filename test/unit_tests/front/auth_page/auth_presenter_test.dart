import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/pages/auth/auth_presenter/auth_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../back/user/user_auth_test.dart';

void main() {
  var mockServer = MockServer();
  var user = User(mockServer);

  test('Auth presenter provides static content by default', () {
    var authPagePresenter = AuthPagePresenter(user);

    var state = authPagePresenter.state as UserNotAuthenticated;

    expect(state.labels.email, equals('EMAIL'));
    expect(state.labels.password, equals('PASSWORD'));
    expect(state.labels.submit, equals('SUBMIT'));
  });

  test('Log in successful', () async {
    mockServer.mockAuthApi.signInSuccess = true;
    var authPagePresenter = AuthPagePresenter(user);

    const logInEvent = LogInEvent(email: 'toto@gmail.com', password: 'toto1234');
    authPagePresenter.add(logInEvent);
    var state = await authPagePresenter.stream.first;

    expect(state, isA<UserLoggedIn>());
  });
}
