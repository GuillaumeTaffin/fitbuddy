import 'package:fitbuddy/back/user/user.dart';
import 'package:fitbuddy/front/components/drawer.dart';
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
      child: HomePageScaffold(),
    );
  }
}

class HomePageScaffold extends StatelessWidget {
  const HomePageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      drawer: FBDrawer(
        onPressed: () => context.read<HomePageBloc>().add(LogOutEvent()),
      ),
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is UserLoggedOut) context.go("/login");
        },
        builder: (context, state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 200, child: Image(image: AssetImage('images/logo512.png'))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sized(FBElevatedButton(
                      icon: Icons.add,
                      label: 'CREATE PLAN',
                      onPressed: () {},
                    )),
                    sized(FBElevatedButton(
                      icon: Icons.play_arrow,
                      label: 'START TRAINING',
                      onPressed: () {},
                    )),
                    sized(FBElevatedButton(
                      icon: Icons.query_stats,
                      label: 'REVIEW PERFS',
                      onPressed: () {},
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox sized(Widget child) {
    return SizedBox(
      width: double.infinity,
      child: child,
    );
  }
}

class FBElevatedButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final String label;

  FBElevatedButton({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
