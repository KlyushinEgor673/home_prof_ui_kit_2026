import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key, required this.changeValue, required this.isActive});

  final ValueChanged<bool> changeValue;
  final bool isActive;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  late bool isActive;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      child: Container(
        width: orientation == Orientation.portrait ? 48.w : 48,
        height: orientation == Orientation.portrait ? 28.w : 28,
        decoration: BoxDecoration(
          color: isActive
              ? Color.fromRGBO(26, 111, 238, 1)
              : Color.fromRGBO(235, 235, 235, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              bottom: orientation == Orientation.portrait ? 2.w : 2,
              top: orientation == Orientation.portrait ? 2.w : 2,
              left: isActive
                  ? orientation == Orientation.portrait
                        ? 22.w
                        : 22
                  : orientation == Orientation.portrait
                  ? 2.w
                  : 2,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: Container(
                width: orientation == Orientation.portrait ? 24.w : 24,
                height: orientation == Orientation.portrait ? 24.w : 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                    ),
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 8,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        widget.changeValue(isActive);
      },
    );
  }
}
