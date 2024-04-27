import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final Widget child;
  final double height;
  final double? width;
  final Gradient gradient;

  const MyElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.borderRadius,
      this.height = 44.0,
      this.width,
      this.gradient = const LinearGradient(
        colors: [Colors.cyan, Colors.indigo],
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        child: child,
      ),
    );
  }
}
