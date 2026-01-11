import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({
    super.key,
    this.width = 335,
    this.height = 138,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromRGBO(242, 242, 242, 1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(228, 232, 245, 0.6),
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0
          )
        ]
      ),
      child: child,
    );
  }
}
