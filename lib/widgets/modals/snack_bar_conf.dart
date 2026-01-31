import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SnackBarConf extends StatelessWidget {
  const SnackBarConf({
    super.key,
    required this.width,
    required this.height,
    required this.content,
  });

  final double width;
  final double height;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 24,
            left: 20,
            child: SizedBox(
              width: 267,
              child: Text(
                content,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 28 / 20,
                  letterSpacing: 0.38,
                  color: Colors.black,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: GestureDetector(
              child: SvgPicture.asset(
                'icons/dismiss-blue.svg',
                package: 'home_prof_ui_kit_2026',
                height: 24,
                width: 24,
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
