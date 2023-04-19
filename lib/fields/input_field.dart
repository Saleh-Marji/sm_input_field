import 'package:flutter/material.dart';

import '../models/field_info.dart';
import '../utils/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.borderColor,
    this.elevation,
    this.prefixIcon,
    this.labelText,
    this.labelFieldSpace,
    this.isMultiline,
    this.inputType,
  }) : super(key: key);

  ///This constructor takes a field info object for the main properties (used mostly for forms)
  factory InputField.fromFieldInfo(
    FieldInfo info, {
    double? labelFieldSpace,
    Color? borderColor,
    double? elevation,
  }) =>
      InputField(
        controller: info.controller,
        hintText: info.hint,
        prefixIcon: info.prefixIcon,
        labelText: '${info.label}${(info.required ?? false) ? ' (Required)' : ''}',
        inputType: info.inputType,
        isMultiline: info.multiLine,
        labelFieldSpace: labelFieldSpace ?? 10,
        borderColor: borderColor,
        elevation: elevation ?? 3,
      );

  /// the controller of the field
  final TextEditingController? controller;

  /// the onChanged of the field
  final ValueChanged<String>? onChanged;

  /// the hint text shown in the field in grey
  final String? hintText;

  /// the label text show above the field
  final String? labelText;

  /// the space between the label and the field
  final double? labelFieldSpace;

  /// the color of the border of the field
  final Color? borderColor;

  /// the prefix icon
  final IconData? prefixIcon;

  /// the elevation of the field
  final double? elevation;

  /// specifies if the field is multiline, which makes the field expand up to 5 lines
  /// and makes the keyboard of type multiline
  final bool? isMultiline;

  /// specifies the keyboard type of the field
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    Widget widget = TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: kTextStyleMain,
      minLines: 1,
      maxLines: (isMultiline ?? false) ? 5 : 1,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon!,
                size: 25,
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? kColorBlue),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    );

    if (elevation != null) {
      widget = Material(
        borderRadius: BorderRadius.circular(
          10,
        ),
        elevation: elevation!,
        child: widget,
      );
    }

    if (labelText != null) {
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: kTextStyleMain.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: labelFieldSpace ?? 20,
          ),
          widget,
        ],
      );
    }

    return widget;
  }
}
