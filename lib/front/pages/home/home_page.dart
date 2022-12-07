import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/components/buttons.dart';
import 'package:fitbuddy/front/pages/home/home_page_presenter/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(context.read<User>()),
      child: Scaffold(
        body: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is UserLoggedOut) context.go("/login");
          },
          builder: (context, state) => Center(
            child: FBButton(
              child: const Text('LOG OUT'),
              onPressed: () => context.read<HomePageBloc>().add(LogOutEvent()),
            ),
          ),
        ),
      ),
    );
  }
}
