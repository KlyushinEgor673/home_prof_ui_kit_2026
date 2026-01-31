import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SmallButtonColor { blue, lightBlue, white, gray }

class SmallButton extends StatefulWidget {
  const SmallButton({
    super.key,
    this.width = 96,
    this.height = 40,
    required this.color,
    required this.onTap,
    required this.text,
  });

  final double width;
  final double height;
  final SmallButtonColor color;
  final VoidCallback onTap;
  final String text;

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  late Color colorText;
  late Color color;
  String text = '';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    switch (widget.color) {
      case SmallButtonColor.blue:
        color = Color.fromRGBO(32, 116, 242, 1);
        colorText = Colors.white;
        break;
      case SmallButtonColor.lightBlue:
        color = Color.fromRGBO(197, 210, 255, 1);
        colorText = Colors.white;
        break;
      case SmallButtonColor.white:
        color = Colors.white;
        colorText = Color.fromRGBO(32, 116, 242, 1);
        break;
      case SmallButtonColor.gray:
        color = Color.fromRGBO(247, 247, 250, 1);
        colorText = Colors.black;
        break;
    }
    if (widget.text.length <= 8){
      text = widget.text;
    } else {
      text = '${widget.text.substring(0, 7)}...';
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border: widget.color == SmallButtonColor.white
              ? Border.all(color: Color.fromRGBO(32, 116, 242, 1), width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: orientation == Orientation.portrait ? 14.sp : 14,
              height: 20 / 14,
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
