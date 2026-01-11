import 'package:flutter/material.dart';
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
    return CardBackground(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 20 / 16,
                letterSpacing: -0.32,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 20,
            child: Text(
              lateDays,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: SmallButton(
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
