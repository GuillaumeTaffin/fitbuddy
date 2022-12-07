import 'package:fitbuddy/back/server.dart';
import 'package:fitbuddy/back/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

final mockServer = MockServer();

void main() {
  var user = User(mockServer);

  group('User provides authenticated state', () {
    test('User is not authenticated if no session is found', () {
      expect(user.isAuthenticated, false);
      expect(user.isNotAuthenticated, true);
    });

    test('User is authenticated if a session is found', () {
      mockServer.mockAuthApi.sessionFound = true;
      expect(user.isAuthenticated, true);
      expect(user.isNotAuthenticated, false);
    });
  });

  group('User allows to login', () {
    test('Successful if the server manages to login', () async {
      mockServer.mockAuthApi.signInSuccess = true;

      var success = await user.login('email@gmail.com', 'password');

      expect(success, true);
    });

    test('Failure if the server forbids to login', () async {
      mockServer.mockAuthApi.signInSuccess = false;

      var success = await user.login('email@gmail.com', 'password');

      expect(success, false);
    });
  });

  test('User allows to log out', () async {
    mockServer.mockAuthApi.logoutSuccess = true;

    var success = await user.logout();

    expect(success, true);
  });
}

class MockServer implements Server {
  final MockAuthApi mockAuthApi = MockAuthApi();

  @override
  AuthApi get authApi => mockAuthApi;
}

class MockAuthApi implements AuthApi {
  bool sessionFound = false;
  bool signInSuccess = false;
  bool signUpSuccess = false;
  bool logoutSuccess = false;

  @override
  Future<bool> signIn(String email, String password) async {
    return signInSuccess;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    return signUpSuccess;
  }

  @override
  bool isAuthenticated() {
    return sessionFound;
  }

  @override
  Future<bool> logout() async {
    return logoutSuccess;
  }
}
