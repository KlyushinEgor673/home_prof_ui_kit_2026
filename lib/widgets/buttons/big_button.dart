import 'package:flutter/material.dart';

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
        color = Color.fromRGBO(32, 116, 242, 1);
        colorText = Colors.white;
        break;
      case BigButtonColor.lightBlue:
        color = Color.fromRGBO(197, 210, 255, 1);
        colorText = Colors.white;
        break;
      case BigButtonColor.white:
        color = Colors.white;
        colorText = Color.fromRGBO(32, 116, 242, 1);
        break;
      case BigButtonColor.gray:
        color = Color.fromRGBO(247, 247, 250, 1);
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
              ? Border.all(color: Color.fromRGBO(32, 116, 242, 1), width: 1)
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
