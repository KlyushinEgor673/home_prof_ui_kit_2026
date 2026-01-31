import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
    this.width = 335,
    this.height = 48,
    required this.textEditingController,
  });

  final double width;
  final double height;
  final TextEditingController textEditingController;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(
      () => {
        if (_focusNode.hasFocus)
          {
            setState(() {
              _isFocused = true;
            }),
          }
        else
          {
            setState(() {
              _isFocused = false;
            }),
          },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 249, 1),
        border: Border.all(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            left: orientation == Orientation.portrait ? 14.w : 14,
            top: 0,
            bottom: 0,
            child: Center(
              child: SvgPicture.asset(
                'icons/search.svg',
                package: 'home_prof_ui_kit_2026',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 42.w : 42,
            top: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                width:  widget.width - (orientation == Orientation.portrait ? 96.w : 96),
                child: TextSelectionTheme(data: TextSelectionThemeData(
                  cursorColor: Color.fromRGBO(32, 116, 242, 1),
                  selectionHandleColor: Color.fromRGBO(32, 116, 242, 1),
                  selectionColor: Color.fromRGBO(32, 116, 242, 0.5),
                ), child: TextField(
                  focusNode: _focusNode,
                  controller: widget.textEditingController,
                  style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                      fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                      height: 20 / 16,
                      letterSpacing: -0.32
                  ),
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'Искать описание',
                  hintStyle: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,
                    fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                    height: 20 / 16,
                    letterSpacing: -0.32,
                    color: Color.fromRGBO(147, 147, 150, 1)
                  )),
                )),
              ),
            ),
          ),
          if (_isFocused)
            Positioned(
              right: orientation == Orientation.portrait ? 14.w : 14,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'icons/close.svg',
                    package: 'home_prof_ui_kit_2026',
                    height: orientation == Orientation.portrait ? 20.h : 20,
                    width: orientation == Orientation.portrait ? 20.w : 20,
                  ),
                  onTap: (){
                    widget.textEditingController.text = '';
                    setState(() {});
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
