import 'package:supabase_flutter/supabase_flutter.dart';

const devUrl = 'http://localhost:54321';
const devKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs';

Future<void> connectSupabase() async {
  const url = String.fromEnvironment('SUPABASE_URL', defaultValue: devUrl);
  const key = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: devKey);

  await Supabase.initialize(url: url, anonKey: key);
}
