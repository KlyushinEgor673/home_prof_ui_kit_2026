import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum InputType { text, password, date, email }

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.width = 335,
    this.height = 48,
    required this.hintText,
    required this.errorText,
    required this.controller,
    this.title,
    required this.type, this.startError,
  });

  final double width;
  final double height;
  final String hintText;
  final String errorText;
  final TextEditingController controller;
  final String? title;
  final InputType type;
  final String? startError;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocus = false;
  bool _isError = false;
  bool _isPassword = false;
  bool _isEyeOn = true;
  String oldValue = '';
  String errorText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      errorText = widget.errorText;
    });
    if (widget.startError != null){
      setState(() {
        errorText = widget.startError!;
        _isError = true;
      });
    }
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isError = false;
          _isFocus = true;
        });
      } else {
        if (widget.controller.text == '') {
          setState(() {
            _isError = true;
            errorText = widget.errorText;
          });
        } else if (widget.type == InputType.date){
          if (widget.controller.text.length < 10){
            setState(() {
              _isError = true;
            });
          } else {
            List dateList = widget.controller.text.split('.');
            int day = int.parse(dateList[0]);
            int month = int.parse(dateList[1]);
            int year = int.parse(dateList[2]);
            final date = DateTime(year, month, day);
            if (date.year != year || date.month != month || date.day != day) {
              setState(() {
                errorText = "Введите коректную дату";
                _isError = true;
              });
            } else {
              setState(() {
                _isError = false;
              });
            }
          }
        } else if (widget.type == InputType.email){
          bool isValid =  EmailValidator.validate(widget.controller.text);
          if (!isValid){
            setState(() {
              errorText = "Введите коректный email";
              _isError = true;
            });
          }
        }
        setState(() {
          _isFocus = false;
        });
      }
    });
    if (widget.type == InputType.password) {
      setState(() {
        _isPassword = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title!,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w400,
                fontSize:orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(126, 126, 154, 1),
              ),
            ),
          ),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _isError
                ? Color.fromRGBO(253, 53, 53, 0.1)
                : Color.fromRGBO(245, 245, 249, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isFocus
                  ? Color.fromRGBO(34, 84, 245, 0.5)
                  : _isError
                  ? Color.fromRGBO(253, 53, 53, 1)
                  : Color.fromRGBO(235, 235, 235, 1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextSelectionTheme(
                    data: TextSelectionThemeData(
                      selectionColor: Color.fromRGBO(26, 111, 238, 0.5),
                      selectionHandleColor: Color.fromRGBO(26, 111, 238, 1),
                      cursorColor: Color.fromRGBO(26, 111, 238, 1),
                    ),
                    child: TextField(
                      focusNode: _focusNode,
                      controller: widget.controller,
                      obscureText: _isPassword
                          ? _isEyeOn
                                ? true
                                : false
                          : false,
                      obscuringCharacter: '*',
                      inputFormatters: widget.type == InputType.date ?  [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                      ] : [],
                      keyboardType: widget.type == InputType.date ? TextInputType.number : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          fontFamily: 'RobotoFlex',
                          fontWeight: FontWeight.w400,
                          fontSize: orientation == Orientation.portrait ? 15.sp : 15,
                          height: 20 / 15,
                          letterSpacing: 0,
                          color: Color.fromRGBO(147, 147, 150, 1),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'RobotoFlex',
                        fontSize: orientation == Orientation.portrait ? 15.sp : 15,
                        fontWeight: FontWeight.w400,
                        height: 20 / 15,
                        letterSpacing: 0,
                      ),
                      onChanged: (value){
                        if (widget.type == InputType.date){
                          if (oldValue.endsWith('.') && value.length == 2){
                            setState(() {
                              widget.controller.text = widget.controller.text.substring(0, 1);
                            });
                          }
                          else if (oldValue.endsWith('.') && value.length == 5){
                            setState(() {
                              widget.controller.text = widget.controller.text.substring(0, 4);
                            });
                          }
                          else if (value.length == 2 || value.length == 5){
                            setState(() {
                              widget.controller.text += '.';
                            });
                          }
                          else if (value.length > 10){
                            setState(() {
                              widget.controller.text = widget.controller.text.substring(0, 10);
                            });
                          }
                          setState(() {
                            oldValue = widget.controller.text;
                          });
                        }
                      },
                    ),
                  ),
                ),
                if (widget.type == InputType.password)
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        _isEyeOn ? 'icons/eye-on.svg' : 'icons/eye-off.svg',
                        package: 'home_prof_ui_kit_2026',
                        height: orientation == Orientation.portrait ? 20.sp : 20,
                        width: orientation == Orientation.portrait ? 20.sp : 20,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      onTap: (){
                        setState(() {
                          _isEyeOn = !_isEyeOn;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (_isError)
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              errorText,
              style: TextStyle(
                fontFamily: 'RobotoFlex',
                fontWeight: FontWeight.w400,
                fontSize: orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(253, 53, 53, 1),
              ),
            ),
          ),
      ],
    );
  }
}
