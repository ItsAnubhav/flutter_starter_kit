import 'package:flutter/material.dart';
import 'package:flutter_starter/core/themes/palette.dart';

class MyTextField extends StatefulWidget {
  final Key? key;
  final String labelText;
  final void Function(String) onChanged;
  final VoidCallback? trailingFunction;
  final String? defaultValue;
  final bool showTrailingWidget;
  final Widget? trailing;
  final bool autofocus;
  final TextEditingController? controller;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  final Color borderColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final double borderRadius;
  final String? hintText;
  final bool overrideHintText;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final bool readOnly;
  final int? maxLength;
  final VoidCallback? onTap;
  final Icon? prefixIcon;

   MyTextField({
    required this.labelText,
    required this.onChanged,
    this.key,
    this.onTap,
    this.hintText,
    this.trailingFunction,
    this.defaultValue,
    this.keyboardType,
    this.controller,
    this.validator,
    this.trailing,
    this.width,
    this.margin,
    this.maxLength,
    this.readOnly = false,
    this.maxLines = 1,
    this.overrideHintText = false,
    this.showTrailingWidget = true,
    this.autofocus = false,
    this.isPasswordField = false,
    this.borderColor = Palette.primaryColor,
    this.focusedBorderColor = Palette.primaryColor,
    this.borderWidth = 1,
    this.focusedBorderWidth = 2,
    this.borderRadius = 20,
    this.prefixIcon,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  bool _showPassword = false;

  @override
  void initState() {
    _showPassword = !widget.isPasswordField;
    super.initState();
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: widget.margin,
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        initialValue: widget.defaultValue,
        readOnly: widget.readOnly,
        textAlignVertical: TextAlignVertical.center,
        autofocus: widget.autofocus,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        obscureText: widget.isPasswordField ? !_showPassword : false,
        decoration: InputDecoration(
          hintText: 'Enter Value',
          contentPadding: widget.contentPadding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: widget.focusedBorderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ).copyWith(
          hintText: widget.overrideHintText
              ? widget.hintText
              : "Enter ${widget.labelText}",
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.showTrailingWidget
              ? widget.trailing ?? (widget.isPasswordField
              ? IconButton(
            padding: const EdgeInsets.only(right: 5.0),
            splashRadius: 1,
            icon: _showPassword
                ? Icon(Icons.visibility, size: 25.0)
                : Icon(Icons.visibility_off, size: 25.0),
            onPressed: toggleShowPassword,
          )
              : null)
              : null,
        ),
      ),
    );
  }
}