import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 64.w : 64,
      height: orientation == Orientation.portrait ? 32.h : 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(245, 245, 249, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: minusIsActive ? onTapMinus : (){},
            child: SvgPicture.asset(
              'icons/minus.svg',
              package: 'home_prof_ui_kit_2026',
              color: minusIsActive
                  ? Color.fromRGBO(147, 147, 150, 1)
                  : Color.fromRGBO(184, 193, 204, 1),
              height: orientation == Orientation.portrait ? 20.h : 20,
              width: orientation == Orientation.portrait ? 20.w : 20,
            ),
          ),
          Container(
            width: 2.w,
            height: 16.h,
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
              height: orientation == Orientation.portrait ? 20.h : 20,
              width: orientation == Orientation.portrait ? 20.w : 20,
            ),
          ),
        ],
      ),
    );
  }
}
