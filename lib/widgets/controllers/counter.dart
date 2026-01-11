import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.minusIsActive,
    required this.onTapMinus,
    required this.onTapPlus,
  });

  final bool minusIsActive;
  final VoidCallback onTapMinus;
  final VoidCallback onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(245, 245, 249, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: minusIsActive ? onTapMinus : null,
            child: SvgPicture.asset(
              'icons/minus.svg',
              package: 'home_prof_ui_kit_2026',
              color: minusIsActive
                  ? Color.fromRGBO(147, 147, 150, 1)
                  : Color.fromRGBO(184, 193, 204, 1),
            ),
          ),
          Container(
            width: 2,
            height: 16,
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 235, 1),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          GestureDetector(
            onTap: onTapPlus,
            child: SvgPicture.asset(
              'icons/plus.svg',
              package: 'home_prof_ui_kit_2026',
              color: Color.fromRGBO(147, 147, 150, 1),
            ),
          ),
        ],
      ),
    );
  }
}
