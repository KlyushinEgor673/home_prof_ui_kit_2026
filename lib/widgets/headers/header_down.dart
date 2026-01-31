import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      width: width,
      height: orientation == Orientation.portrait ? 84.h : 84,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Back(onTap: backCallback),
          ),
          Positioned(
            right: 0,
            bottom: 4.h,
            child: GestureDetector(
              onTap: deleteCallback,
              child: SvgPicture.asset(
                'icons/delete.svg',
                package: 'home_prof_ui_kit_2026',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
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
                fontSize: orientation == Orientation.portrait ? 24.sp : 24,
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
