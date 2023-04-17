import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../models/field_info.dart';

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

  factory InputField.fromFieldInfo(
    FieldInfo info, {
    double? labelFieldSpace,
    Color? borderColor,
    double? elevation,
  }) =>
      InputField(
        controller: info.controller,
        hintText: info.hint,
        prefixIcon: info.icon,
        labelText: '${info.label}${(info.required ?? false) ? ' (Required)' : ''}',
        inputType: info.inputType,
        isMultiline: info.multiLine,
        labelFieldSpace: labelFieldSpace ?? 10,
        borderColor: borderColor,
        elevation: elevation ?? 3,
      );

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText, labelText;
  final double? labelFieldSpace;
  final Color? borderColor;
  final IconData? prefixIcon;
  final double? elevation;
  final bool? isMultiline;
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon!, size: 25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? kColorBlue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    if (elevation != null) {
      widget = Material(
        borderRadius: BorderRadius.circular(10),
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
            style: kTextStyleMain.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: labelFieldSpace ?? 20),
          widget,
        ],
      );
    }

    return widget;
  }
}
