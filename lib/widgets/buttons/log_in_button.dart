import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    this.width = 335,
    this.height = 60,
    required this.isVK,
    required this.onTap,
  });

  final double width;
  final double height;
  final bool isVK;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color.fromRGBO(230, 230, 230, 1), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isVK ? 'images/vk.svg' : 'images/yandex.svg',
              package: 'home_prof_ui_kit_2026',
              height: orientation == Orientation.portrait ? 32.w : 32,
              width: orientation == Orientation.portrait ? 32.w : 32,
            ),
            SizedBox(width: orientation == Orientation.portrait ? 16.w : 16),
            Text(isVK ? 'Войти с VK' : 'Войти с Yandex', style: TextStyle(
              fontFamily: 'RobotoFlex',
              fontWeight: FontWeight.w500,
              fontSize: orientation == Orientation.portrait ? 17.sp : 17,
              height: 24 / 17,
              letterSpacing: 0
            ),),
          ],
        ),
      ),
    );
  }
}
