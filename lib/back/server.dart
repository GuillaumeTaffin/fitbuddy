import 'package:supabase_flutter/supabase_flutter.dart';

const devUrl = 'http://localhost:54321';
const devKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs';

Future<void> connectSupabase() async {
  const url = String.fromEnvironment('SUPABASE_URL', defaultValue: devUrl);
  const key = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: devKey);

  await Supabase.initialize(url: url, anonKey: key);
}

abstract class Server {
  AuthApi get authApi;
}

abstract class AuthApi {
  Future<bool> signUp(String email, String password);

  Future<bool> signIn(String email, String password);

  bool isAuthenticated();

  Future<bool> logout();
}

class SupabaseServer implements Server {
  @override
  AuthApi get authApi => SupabaseAuthApi();
}

class SupabaseAuthApi implements AuthApi {
  final authClient = Supabase.instance.client.auth;

  @override
  Future<bool> signIn(String email, String password) async {
    await authClient.signInWithPassword(password: password, email: email);
    return isAuthenticated();
  }

  @override
  Future<bool> signUp(String email, String password) async {
    await authClient.signUp(password: password, email: email);
    return isAuthenticated();
  }

  @override
  bool isAuthenticated() {
    return authClient.currentSession != null;
  }

  @override
  Future<bool> logout() async {
    await authClient.signOut();
    return true;
  }
}
