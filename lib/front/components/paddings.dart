import 'package:flutter/cupertino.dart';

class FBPadding extends StatelessWidget {
  static double baseValue = 8.0;

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Widget child;

  const FBPadding._({Key? key, this.left = 0, this.top = 0, this.right = 0, this.bottom = 0, required this.child})
      : super(key: key);

  factory FBPadding.vertical({required Widget child}) {
    return FBPadding._(
      top: baseValue,
      bottom: baseValue,
      child: child,
    );
  }

  factory FBPadding.all({required Widget child}) {
    return FBPadding._(
      top: baseValue,
      bottom: baseValue,
      left: baseValue,
      right: baseValue,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: child,
    );
  }
}
