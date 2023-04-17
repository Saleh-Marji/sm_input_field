import 'package:flutter/material.dart';

class FieldInfo {
  TextEditingController controller;
  String? hint, label;
  IconData? icon;
  TextInputType? inputType;
  bool? multiLine;
  bool? required;

  FieldInfo({
    TextEditingController? controller,
    String? initialValue,
    this.required,
    this.icon,
    this.label,
    this.hint,
    this.inputType,
    this.multiLine,
  }) : this.controller = controller ?? TextEditingController(text: initialValue);

  factory FieldInfo.multiLine({
    TextEditingController? controller,
    String? initialValue,
    String? hint,
    String? label,
    IconData? icon,
    bool? required,
  }) =>
      FieldInfo(
        controller: controller,
        initialValue: initialValue,
        multiLine: true,
        hint: hint,
        label: label,
        icon: icon,
        required: required,
      );

  void dispose() => controller.dispose();
}
