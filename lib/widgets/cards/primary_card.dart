import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_prof_ui_kit_2026/home_prof_ui_kit_2026.dart';

import 'card_background.dart';

class PrimaryCard extends StatefulWidget {
  const PrimaryCard({
    super.key,
    this.width = 335,
    this.height = 138,
    required this.name,
    required this.type,
    required this.price,
    required this.isAdd,
    required this.onTap,
  });

  final double width;
  final double height;
  final String name;
  final String type;
  final String price;
  final bool isAdd;
  final VoidCallback onTap;

  @override
  State<PrimaryCard> createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return CardBackground(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            top: orientation == Orientation.portrait ? 16.h : 16,
            child: SizedBox(
              width: 303,
              child: Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                ),
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 44.h : 44,
            child: Text(
              widget.type,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: Text(
              '${widget.price} ₽',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: orientation == Orientation.portrait ? 17.sp : 17,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: SmallButton(
              width: orientation == Orientation.portrait ? 96.w : 96,
              height: orientation == Orientation.portrait ? 40.h : 40,
              color: widget.isAdd
                  ? SmallButtonColor.white
                  : SmallButtonColor.blue,
              onTap: widget.onTap,
              text: widget.isAdd ? 'Убрать' : 'Добавить',
            ),
          ),
        ],
      ),
    );
  }
}
