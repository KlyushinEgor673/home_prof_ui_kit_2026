import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Filter extends StatelessWidget {
  const Filter({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Color.fromRGBO(245, 245, 249, 1),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: SvgPicture.asset(
            'icons/filter.svg',
            package: 'home_prof_ui_kit_2026',
            width: 20,
            height: 20,
            color: Color.fromRGBO(126, 126, 154, 1),
          ),
        ),
      ),
    );;
  }
}
