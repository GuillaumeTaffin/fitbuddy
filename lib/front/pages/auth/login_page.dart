import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/components/buttons.dart';
import 'package:fitbuddy/front/components/layouts.dart';
import 'package:fitbuddy/front/components/paddings.dart';
import 'package:fitbuddy/front/components/textfields.dart';
import 'package:fitbuddy/front/pages/auth/auth_presenter/auth_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPagePresenter(context.read<User>()),
      child: Scaffold(
        body: FBPadding.all(
          child: BlocConsumer<AuthPagePresenter, AuthPageState>(
            listener: (context, state) {
              if (state is UserLoggedIn) {
                context.go("/");
              }
            },
            builder: (context, state) {
              if (state is UserNotAuthenticated) {
                return FBColumn(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FBTextField(
                      label: state.labels.email,
                      controller: emailController,
                    ),
                    FBPassword(
                      label: state.labels.password,
                      controller: passwordController,
                    ),
                    FBButton(
                      child: Text(state.labels.submit),
                      onPressed: () => _logIn(context),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  void _logIn(BuildContext context) => context.read<AuthPagePresenter>().add(LogInEvent(
        email: emailController.text,
        password: passwordController.text,
      ));
}
