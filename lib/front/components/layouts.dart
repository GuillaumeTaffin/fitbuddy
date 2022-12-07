import 'package:fitbuddy/front/components/paddings.dart';
import 'package:flutter/material.dart';

class FBColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  const FBColumn({Key? key, required this.children, this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: _children(),
    );
  }

  List<Widget> _children() => children
      .map((element) => FBPadding.vertical(
            child: element,
          ))
      .toList();
}
