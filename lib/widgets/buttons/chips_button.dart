import 'package:flutter/material.dart';

enum ChipsButtonColor { blue, gray }

class ChipsButton extends StatelessWidget {
  const ChipsButton({super.key, required this.color, required this.onTap});
  final ChipsButtonColor color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: color == ChipsButtonColor.blue ? Color.fromRGBO(32, 116, 242, 1) : Color.fromRGBO(247, 247, 250, 1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text("Популярные", style: TextStyle(
              fontFamily: "RobotoFlex",
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 20 / 15,
              letterSpacing: 0,
              color: color == ChipsButtonColor.blue ? Colors.white : Color.fromRGBO(135, 135, 161, 1)
            ),),
          ),
        ),
      ),
    );
  }
}
