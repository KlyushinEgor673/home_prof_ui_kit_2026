import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    required this.onTapPlus,
    required this.onClose,
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return CardBackground(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: orientation == Orientation.portrait ? 16.h : 16,
            left: orientation == Orientation.portrait ? 16.w : 16,
            child: SizedBox(
              width: orientation == Orientation.portrait ? 275.w : 275,
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                  fontFamily: 'RobotoFlex',
                ),
              ),
            ),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? 16.h : 16,
            right: orientation == Orientation.portrait ? 16.w : 16,
            child: GestureDetector(
              onTap: onClose,
              child: SvgPicture.asset(
                'icons/close.svg',
                package: 'home_prof_ui_kit_2026',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 20.w : 20,
            bottom: orientation == Orientation.portrait ? 20.h : 20,
            child: Text(
              '$price ₽',
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w500,
                fontSize: orientation == Orientation.portrait ? 17.sp : 17,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            bottom: orientation == Orientation.portrait ? 22.h : 22,
            right: orientation == Orientation.portrait ? 115.w : 115,
            child: Text(
              '$count штук',
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w400,
                fontSize: orientation == Orientation.portrait ? 15.sp : 15,
                height: 20 / 15,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            right: orientation == Orientation.portrait ? 9.w : 9,
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
