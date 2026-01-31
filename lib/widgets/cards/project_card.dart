import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_prof_ui_kit_2026/home_prof_ui_kit_2026.dart';
import 'package:home_prof_ui_kit_2026/widgets/cards/card_background.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    this.width = 335,
    this.height = 138,
    required this.name,
    required this.lateDays,
    required this.onTap,
  });

  final double width;
  final double height;
  final String name;
  final String lateDays;
  final VoidCallback onTap;

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
            right: orientation == Orientation.portrait ? 16 : 16,
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w500,
                fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                height: 20 / 16,
                letterSpacing: -0.32,
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 20.h : 20,
            child: Text(
              lateDays,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w600,
                fontSize: orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: SmallButton(
              width: orientation == Orientation.portrait ? 96.w : 96,
              height: orientation == Orientation.portrait ? 40.h : 40,
              color: SmallButtonColor.blue,
              onTap: onTap,
              text: "Открыть",
            ),
          ),
        ],
      ),
    );
  }
}
