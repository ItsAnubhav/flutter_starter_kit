import 'package:flutter/material.dart';

import '../core/themes/palette.dart';
import '../core/utils/date_utils.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final void Function(String)? onChanged;
  final VoidCallback? trailingFunction;
  final String? defaultValue;
  final bool showTrailingWidget;
  final Widget? trailing;
  final bool autofocus;
  final String dateTimeFormat;
  final TextEditingController? controller;
  final String? Function(String?) validator;
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
  final Color? fillColor;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final int? maxLength;
  final VoidCallback? onTap;
  final Icon? prefixIcon;

  const MyTextField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.trailingFunction,
    this.defaultValue,
    this.keyboardType,
    this.controller,
    required this.validator,
    this.trailing,
    this.dateTimeFormat = "dd MMM",
    this.width,
    this.margin,
    this.maxLength,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.overrideHintText = false,
    this.showTrailingWidget = true,
    this.autofocus = false,
    this.isPasswordField = false,
    this.borderColor = Palette.primaryColor,
    this.focusedBorderColor = Palette.primaryColor,
    this.fillColor,
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
        validator: widget.validator,
        focusNode: widget.keyboardType == TextInputType.datetime
            ? AlwaysDisabledFocusNode()
            : null,
        onTap: () {
          if (widget.keyboardType == TextInputType.datetime) {
            selectDate(context);
          }
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        controller: widget.controller,
        initialValue: widget.defaultValue,
        readOnly: widget.readOnly,
        minLines: widget.minLines,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        obscureText: widget.isPasswordField ? !_showPassword : false,
        decoration: InputDecoration(
          hintText: 'Enter Value',
          contentPadding: widget.contentPadding,
          fillColor: widget.fillColor,
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
              ? widget.trailing ??
                  (widget.isPasswordField
                      ? IconButton(
                          padding: const EdgeInsets.only(right: 5.0),
                          splashRadius: 1,
                          icon: _showPassword
                              ? const Icon(Icons.visibility, size: 25.0)
                              : const Icon(Icons.visibility_off, size: 25.0),
                          onPressed: toggleShowPassword,
                        )
                      : null)
              : null,
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    DateTime? newSelectedDate;
    if (widget.dateTimeFormat.contains("dd") ||
        widget.dateTimeFormat.contains("MM")) {
      newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now().add(const Duration(days: 90)),
      );
    }
    TimeOfDay? newSelectedTime;
    if (widget.dateTimeFormat.contains("hh") ||
        widget.dateTimeFormat.contains("mm")) {
      newSelectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
    }
    if (newSelectedDate != null) {
      widget.controller?.text = DateUtility.formatDateTime(
          dateTime: newSelectedDate, outputFormat: widget.dateTimeFormat);
    }
    if (newSelectedTime != null) {
      widget.controller?.text = DateUtility.formatDateTime(
          dateTime: DateTime.now().add(Duration(
              hours: newSelectedTime.hour, minutes: newSelectedTime.minute)),
          outputFormat: widget.dateTimeFormat);
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
