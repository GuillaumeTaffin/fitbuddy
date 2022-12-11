import 'package:fitbuddy/front/components/buttons.dart';
import 'package:flutter/material.dart';

class FBDrawer extends StatelessWidget {
  final void Function()? onPressed;

  const FBDrawer({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('HEADER')),
          FBButton(
            child: const Text('LOG OUT'),
            onPressed: this.onPressed,
          )
        ],
      ),
    );
  }
}
