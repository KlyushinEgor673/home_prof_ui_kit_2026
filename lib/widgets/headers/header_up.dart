import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_prof_ui_kit_2026/widgets/bubbles/back.dart';

class HeaderUp extends StatelessWidget {
  const HeaderUp({
    super.key,
    required this.title,
    required this.width,
    required this.backCallback,
    required this.deleteCallback,
  });

  final String title;
  final double width;
  final VoidCallback backCallback;
  final VoidCallback deleteCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: 48,
    child: Stack(
      children: [
        Positioned(
          left: 20,
          top: 0,
          child: Back(onTap: backCallback),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Center(
            child: Text(
              'Корзина',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 28 / 20,
                letterSpacing: 0.38,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 26,
          child: GestureDetector(
            onTap: deleteCallback,
            child: SvgPicture.asset(
              'icons/delete.svg',
              package: 'home_prof_ui_kit_2026',
              height: 20,
              width: 20,
              color: Color.fromRGBO(184, 193, 204, 1),
            ),
          ),
        ),
      ],
    ),);
  }
}
