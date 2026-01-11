import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    this.width = 335,
    this.height = 56,
    required this.price,
    required this.onTap,
  });

  final double width;
  final double height;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'RobotoFlex',
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 24 / 17,
      letterSpacing: 0,
    );
    return
      GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(32, 116, 242, 1),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'icons/shopping-cart.svg',
                    package: 'home_prof_ui_kit_2026',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Text('В корзину', style: textStyle),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                children: [
                  Text(price, style: textStyle),
                  SizedBox(width: 6),
                  Text('₽', style: textStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
