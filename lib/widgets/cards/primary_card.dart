import 'package:flutter/material.dart';
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
    return CardBackground(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: SizedBox(
              width: 303,
              child: Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 44,
            child: Text(
              widget.type,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              '${widget.price} ₽',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 17,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: SmallButton(
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
