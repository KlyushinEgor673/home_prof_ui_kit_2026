import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Select extends StatefulWidget {
  const Select({
    super.key,
    this.width = 335,
    this.height = 48,
    required this.title,
    required this.items, required this.changeSelectValue,
  });

  final double width;
  final double height;
  final String title;
  final List<String> items;
  final Function changeSelectValue;

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 14,
              top: 0,
              bottom: 0,
              child: Center(
                child: _selectedValue == null
                    ? Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'RobotoFlex',
                          fontWeight: FontWeight.w400,
                          fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                          height: 20 / 16,
                          letterSpacing: -0.32,
                          color: Color.fromRGBO(147, 147, 150, 1),
                        ),
                      )
                    : Text(
                        _selectedValue!,
                        style: TextStyle(
                          fontFamily: 'RobotoFlex',
                          fontWeight: FontWeight.w400,
                          fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                          height: 20 / 16,
                          letterSpacing: -0.32,
                        ),
                      ),
              ),
            ),
            Positioned(
              right: orientation == Orientation.portrait ? 14.w : 14,
              top: 0,
              bottom: 0,
              child: Center(
                child: SvgPicture.asset(
                  'icons/chevron-down.svg',
                  package: 'home_prof_ui_kit_2026',
                  height: orientation == Orientation.portrait ? 20.h : 20,
                  width: orientation == Orientation.portrait ? 20.w : 20,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            color: Colors.white,
            child: Column(
              children: widget.items
                  .map(
                    (el) => GestureDetector(
                      child: ListTile(title: Text(el)),
                      onTap: () {
                        setState(() {
                          _selectedValue = el;
                        });
                        widget.changeSelectValue(el);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
