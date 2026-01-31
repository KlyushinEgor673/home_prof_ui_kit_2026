import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'RobotoFlex',
      fontSize: orientation == Orientation.portrait ? 17.sp : 17,
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
              top: 0,
              bottom: 0,
              left: orientation == Orientation.portrait ? 16.w : 16,
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'icons/shopping-cart.svg',
                      package: 'home_prof_ui_kit_2026',
                      height: orientation == Orientation.portrait ? 20.h : 20,
                      width: orientation == Orientation.portrait ? 20.w : 20,
                      color: Colors.white,
                    ),
                    SizedBox(width: orientation == Orientation.portrait ? 16.w : 16),
                    Text('В корзину', style: textStyle),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: orientation == Orientation.portrait ? 16.w : 16,
              child: Center(
                child: Row(
                  children: [
                    Text(price, style: textStyle),
                    SizedBox(width: orientation == Orientation.portrait ? 6.w : 6),
                    Text('₽', style: textStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
