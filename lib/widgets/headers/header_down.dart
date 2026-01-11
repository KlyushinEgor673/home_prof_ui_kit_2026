import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_prof_ui_kit_2026/widgets/bubbles/back.dart';

class HeaderDown extends StatelessWidget {
  const HeaderDown({
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
    return SizedBox(
      width: width,
      height: 84,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Back(onTap: backCallback),
          ),
          Positioned(
            top: 11,
            right: 11,
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
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              'Корзина',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w800,
                fontSize: 24,
                height: 28 / 24,
                letterSpacing: 0.33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
