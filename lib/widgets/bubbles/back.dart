import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Back extends StatelessWidget {
  const Back({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            'icons/chevron-left.svg',
            package: 'home_prof_ui_kit_2026',
            height: 20,
            width: 20,
            color: Color.fromRGBO(126, 126, 154, 1),
          ),
        ),
      ),
    );
  }
}
