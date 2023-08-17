import 'package:flutter/material.dart';

class MyWhiteContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  const MyWhiteContainer({
    Key? key,
    this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
