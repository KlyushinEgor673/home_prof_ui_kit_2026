import 'package:flutter/material.dart';
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
            left: 14,
            top: 0,
            bottom: 0,
            child: Center(
              child: SvgPicture.asset(
                'icons/search.svg',
                package: 'home_prof_ui_kit_2026',
                height: 20,
                width: 20,
              ),
            ),
          ),
          Positioned(
            left: 42,
            top: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                width: widget.width - 96,
                child: TextSelectionTheme(data: TextSelectionThemeData(
                  cursorColor: Color.fromRGBO(32, 116, 242, 1),
                  selectionHandleColor: Color.fromRGBO(32, 116, 242, 1),
                  selectionColor: Color.fromRGBO(32, 116, 242, 0.5),
                ), child: TextField(
                  focusNode: _focusNode,
                  controller: widget.textEditingController,
                  decoration: InputDecoration(border: InputBorder.none),
                )),
              ),
            ),
          ),
          if (_isFocused)
            Positioned(
              right: 14,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'icons/close.svg',
                    package: 'home_prof_ui_kit_2026',
                    height: 20,
                    width: 20,
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
