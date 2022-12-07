import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/pages/auth/login_page.dart';
import 'package:fitbuddy/front/pages/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  redirect: (context, state) {
    if (context.read<User>().isNotAuthenticated) {
      return '/login';
    }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);
