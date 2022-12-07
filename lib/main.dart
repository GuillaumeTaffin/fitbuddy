import 'package:fitbuddy/back/server.dart';
import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await connectSupabase();

  runApp(const FitBuddyApp());
}

class FitBuddyApp extends StatelessWidget {
  const FitBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => User(SupabaseServer()),
      child: MaterialApp.router(
        title: 'FIT BUDDY',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
