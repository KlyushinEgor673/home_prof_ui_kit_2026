import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key, required this.changeValue});
  final ValueChanged<bool> changeValue;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 48,
        height: 28,
        decoration: BoxDecoration(
          color: isActive
              ? Color.fromRGBO(26, 111, 238, 1)
              : Color.fromRGBO(235, 235, 235, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              bottom: 2,
              top: 2,
              left: isActive ? 22 : 2,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.06)
                    ),
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 8,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.15)
                    )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          isActive = !isActive;
        });
        widget.changeValue(isActive);
      },
    );
  }
}
