import 'package:flutter/material.dart';
import 'package:home_prof_ui_kit_2026/ColorsApp.dart';

enum BigButtonColor { blue, lightBlue, white, gray }

class BigButton extends StatefulWidget {
  const BigButton({
    super.key,
    this.width = 335,
    this.height = 56,
    required this.color,
    required this.onTap,
  });

  final double width;
  final double height;
  final BigButtonColor color;
  final VoidCallback onTap;

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  late Color colorText;
  late Color color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.color) {
      case BigButtonColor.blue:
        color = ColorsApp.accent;
        colorText = Colors.white;
        break;
      case BigButtonColor.lightBlue:
        color = ColorsApp.accentInactive;
        colorText = Colors.white;
        break;
      case BigButtonColor.white:
        color = Colors.white;
        colorText = ColorsApp.accent;
        break;
      case BigButtonColor.gray:
        color = ColorsApp.inputBG;
        colorText = Colors.black;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border: widget.color == BigButtonColor.white
              ? Border.all(color: ColorsApp.accent, width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            "Подтвердить",
            style: TextStyle(
              color: colorText,
              fontSize: 17,
              height: 24 / 17,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              fontFamily: 'RobotoFlex',
              // fontFamily:
            ),
          ),
        ),
      ),
    );
  }
}
