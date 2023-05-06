import 'package:flutter/material.dart';

import '../models/field_info.dart';
import '../utils/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
    this.innerLabelText,
    this.borderColor,
    this.elevation,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.labelFieldSpace,
    this.isMultiline,
    this.inputType,
    this.onTap,
    this.readOnly,
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
        suffixIcon: info.suffixIcon,
        labelText: info.label == null ? null : '${info.label}${(info.required ?? false) ? ' (Required)' : ''}',
        inputType: info.inputType,
        isMultiline: info.multiLine,
        innerLabelText: info.innerLabel == null
            ? null
            : '${info.innerLabel} ${((info.label == null && (info.required ?? false)) ? ' (Required)' : '')}',
        labelFieldSpace: labelFieldSpace ?? 10,
        borderColor: borderColor,
        elevation: elevation ?? 3,
        onTap: info.onTap,
        readOnly: info.readOnly,
      );

  /// the controller of the field
  final TextEditingController? controller;

  /// the onChanged of the field
  final ValueChanged<String>? onChanged;

  /// the hint text shown in the field in grey
  final String? hintText;

  /// the label text show above the field
  final String? labelText;

  /// the label that appears to the right of the suffix icon (suffix icon can be null)
  final String? innerLabelText;

  /// the space between the label and the field
  final double? labelFieldSpace;

  /// the color of the border of the field
  final Color? borderColor;

  /// the prefix icon
  final IconData? prefixIcon;

  ///the suffix icon
  final IconData? suffixIcon;

  /// the elevation of the field
  final double? elevation;

  /// specifies if the field is multiline, which makes the field expand up to 5 lines
  /// and makes the keyboard of type multiline
  final bool? isMultiline;

  /// specifies the keyboard type of the field
  final TextInputType? inputType;

  /// specifies if the field is read only
  final bool? readOnly;

  /// specifies the action to be taken when the field is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget? prefixIconWidget;
    if (prefixIcon != null || innerLabelText != null) {
      List<Widget> children = [
        const SizedBox(width: 10),
        if (prefixIcon != null) Icon(prefixIcon, size: 25),
        if (prefixIcon != null && innerLabelText != null) const SizedBox(width: 10),
        if (innerLabelText != null)
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(innerLabelText!, style: kTextStyleMain),
          )
      ];
      prefixIconWidget = Row(mainAxisSize: MainAxisSize.min, children: children);
    }
    Widget widget = TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: kTextStyleMain,
      minLines: 1,
      maxLines: (isMultiline ?? false) ? 5 : 1,
      keyboardType: inputType,
      readOnly: readOnly ?? false,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: prefixIconWidget,
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon!,
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
