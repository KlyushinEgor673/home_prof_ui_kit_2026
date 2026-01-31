import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BigButtonColor { blue, lightBlue, white, gray }

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    this.width = 335,
    this.height = 56,
    required this.color,
    required this.onTap,
    required this.text,
  });

  final double width;
  final double height;
  final BigButtonColor color;
  final VoidCallback onTap;
  final String text;

  Color get _buttonColor {
    switch (color) {
      case BigButtonColor.blue:
        return Color.fromRGBO(32, 116, 242, 1);
      case BigButtonColor.lightBlue:
        return Color.fromRGBO(197, 210, 255, 1);
      case BigButtonColor.white:
        return Colors.white;
      case BigButtonColor.gray:
        return Color.fromRGBO(247, 247, 250, 1);
    }
  }

  Color get _textColor {
    switch (color) {
      case BigButtonColor.blue:
      case BigButtonColor.lightBlue:
        return Colors.white;
      case BigButtonColor.white:
        return Color.fromRGBO(32, 116, 242, 1);
      case BigButtonColor.gray:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _buttonColor,
          border: color == BigButtonColor.white
              ? Border.all(color: Color.fromRGBO(32, 116, 242, 1), width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _textColor,
              fontSize: orientation == Orientation.portrait ? 17.sp : 17,
              height: 24 / 17,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              fontFamily: 'RobotoFlex',
            ),
          ),
        ),
      ),
    );
  }
}