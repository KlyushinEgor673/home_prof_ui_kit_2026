import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ChipsButtonColor { blue, gray }

class ChipsButton extends StatelessWidget {
  const ChipsButton({super.key, required this.color, required this.onTap, required this.text});
  final ChipsButtonColor color;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          height: orientation == Orientation.portrait ? 48.h : 48,
          padding: EdgeInsets.symmetric(horizontal: orientation == Orientation.portrait ? 20.w : 20),
          decoration: BoxDecoration(
            color: color == ChipsButtonColor.blue ? Color.fromRGBO(32, 116, 242, 1) : Color.fromRGBO(247, 247, 250, 1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(text, style: TextStyle(
              fontFamily: "RobotoFlex",
              fontWeight: FontWeight.w500,
              fontSize: orientation == Orientation.portrait ? 15.sp : 15,
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
