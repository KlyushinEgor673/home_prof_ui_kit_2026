import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_prof_ui_kit_2026/widgets/cards/card_background.dart';
import 'package:home_prof_ui_kit_2026/widgets/controllers/counter.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    this.width = 335,
    this.height = 138,
    required this.name,
    required this.price,
    required this.count,
    required this.minusIsActive,
    required this.onTapMinus,
    required this.onTapPlus, required this.onClose,
  });

  final double width;
  final double height;
  final String name;
  final String price;
  final int count;
  final bool minusIsActive;
  final VoidCallback onTapMinus;
  final VoidCallback onTapPlus;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: SizedBox(
              width: 275,
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                  fontFamily: 'RobotoFlex',
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: onClose,
              child: SvgPicture.asset(
                'icons/close.svg',
                package: 'home_prof_ui_kit_2026',
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Text(
              '$price ₽',
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w500,
                fontSize: 17,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(bottom: 22, right: 115, child: Text('$count штук')),
          Positioned(
            bottom: 16,
            right: 9,
            child: Counter(
              minusIsActive: minusIsActive,
              onTapMinus: onTapMinus,
              onTapPlus: onTapPlus,
            ),
          ),
        ],
      ),
    );
  }
}
