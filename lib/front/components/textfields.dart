import 'package:flutter/material.dart';

class FBTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController? controller;
  final String label;

  const FBTextField({Key? key, this.obscureText = false, this.controller, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
    );
  }
}

class FBPassword extends StatelessWidget {
  final TextEditingController? controller;
  final String label;

  const FBPassword({Key? key, this.controller, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FBTextField(
      obscureText: true,
      controller: controller,
      label: label,
    );
  }
}
