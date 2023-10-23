import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';

class BoxedTextField extends StatefulWidget {
  final int length;
  final Function(String value) onEditingComplete;
  final double boxWidth;
  final double boxHeight;
  final double boxSpacing;
  final double boxBorderRadius;
  final Color boxBorderColor;
  final Color boxFocusedBorderColor;
  final double focusedBorderWidth;
  final Color boxBackgroundColor;
  final TextInputType keyBoardType;

  const BoxedTextField({
    Key? key,
    this.length = 6,
    required this.onEditingComplete,
    this.boxWidth = 40,
    this.boxHeight = 50,
    this.boxSpacing = 5,
    this.boxBorderRadius = 7,
    this.focusedBorderWidth = 2,
    this.boxBorderColor = Colors.black,
    this.boxFocusedBorderColor = Palette.primaryColor,
    this.boxBackgroundColor = Colors.white,
    this.keyBoardType = TextInputType.number,
  }) : super(key: key);

  @override
  State<BoxedTextField> createState() => _BoxedTextFieldState();
}

class _BoxedTextFieldState extends State<BoxedTextField> {
  final FocusNode _focusNode = FocusNode();
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: 10,
            width: 10,
            child: TextFormField(
              focusNode: _focusNode,
              controller: editingController,
              keyboardType: widget.keyBoardType,
              maxLength: widget.length,
              decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  focusColor: Colors.transparent),
              onChanged: (value) {
                if (value.length == widget.length) {
                  _focusNode.unfocus();
                  widget.onEditingComplete(editingController.text);
                }
                setState(() {});
              },
              autofocus: true,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _focusNode.requestFocus();
          },
          splashFactory: NoSplash.splashFactory,
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  widget.length,
                  (index) => Container(
                        height: widget.boxHeight,
                        width: widget.boxWidth,
                        margin:
                            EdgeInsets.symmetric(horizontal: widget.boxSpacing),
                        decoration: BoxDecoration(
                          color: widget.boxBackgroundColor,
                          borderRadius:
                              BorderRadius.circular(widget.boxBorderRadius),
                          border: Border.all(
                              color: editingController.text.length == index
                                  ? widget.boxFocusedBorderColor
                                  : widget.boxBorderColor,
                              width: editingController.text.length == index
                                  ? widget.focusedBorderWidth
                                  : 1),
                        ),
                        child: Center(
                            child: Text(
                          index < editingController.text.length
                              ? editingController.text[index]
                              : "-",
                          style: const TextStyle(fontSize: 25),
                        )),
                      )),
            ),
          ),
        )
      ],
    );
  }
}
