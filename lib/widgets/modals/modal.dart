import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_prof_ui_kit_2026/widgets/modals/modal_background.dart';

class Modal extends StatelessWidget {
  const Modal({
    super.key,
    required this.width,
    required this.height,
    required this.content,
  });

  final double width;
  final double height;
  final String content;

  @override
  Widget build(BuildContext context) {
    return ModalBackground(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 24,
            left: 20,
            child: SizedBox(
              width: 267,
              child: Text(
                content,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 28 / 20,
                  letterSpacing: 0.38,
                ),
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 20,
            child: GestureDetector(
              child: SvgPicture.asset(
                'icons/dismiss.svg',
                package: 'home_prof_ui_kit_2026',
                height: 24,
                width: 24,
                color: Color.fromRGBO(126, 126, 154, 1),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
