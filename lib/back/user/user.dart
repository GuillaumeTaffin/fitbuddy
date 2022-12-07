import '../server.dart';

class User {
  final Server _server;

  User(this._server);

  bool get isAuthenticated => _server.authApi.isAuthenticated();

  bool get isNotAuthenticated => !isAuthenticated;

  Future<bool> login(String email, String password) async {
    return _server.authApi.signIn(email, password);
  }

  Future<bool> logout() async {
    return _server.authApi.logout();
  }
}
