import 'package:flutter/material.dart';

///This is a class to simplify the creation of a form (shown in the examples section)

class FieldInfo {
  ///The TextEditingController specific for the field of the FieldInfo
  TextEditingController controller;

  ///The hint shown in the field
  String? hint;

  /// The label shown above the field in bold
  String? label;

  /// The prefix icon shown in the field
  IconData? prefixIcon;

  /// The suffix icon shown in the field
  IconData? suffixIcon;

  /// The keyboard type of the field
  TextInputType? inputType;

  /// specifies if the field is multiline or not
  bool? multiLine;

  /// specifies if the field is required or not
  /// if true, a (required) is concatenated to the label
  /// Example: a field with label 'Name'
  /// required: true ===> 'Name (required)'
  /// required: false ===> 'Name'
  bool? required;

  /// specifies if the field is read only
  bool? readOnly;

  /// specifies the action to be performed if the field is tapped
  VoidCallback? onTap;

  FieldInfo({
    TextEditingController? controller,
    String? initialValue,
    this.required,
    this.prefixIcon,
    this.label,
    this.hint,
    this.inputType,
    this.multiLine,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
  }) : controller = controller ?? TextEditingController(text: initialValue);

  /// a named constructor that
  factory FieldInfo.multiLine({
    TextEditingController? controller,
    String? initialValue,
    String? hint,
    String? label,
    IconData? icon,
    bool? required,
    bool? readOnly,
    VoidCallback? onTap,
  }) =>
      FieldInfo(
        controller: controller,
        initialValue: initialValue,
        multiLine: true,
        hint: hint,
        label: label,
        prefixIcon: icon,
        required: required,
        readOnly: readOnly,
        onTap: onTap,
      );

  /// calls the dispose method of the text editing controller
  /// do not forget to call it in the dispose method!
  /// void dispose() {
  ///   info.dispose();
  ///   super.dispose();
  /// }
  void dispose() => controller.dispose();

  ///This method creates a new instance with the specified attributes as the only difference between the
  ///previous instance and the new one
  FieldInfo copyWith({
    TextEditingController? controller,
    bool? required,
    IconData? prefixIcon,
    String? label,
    String? hint,
    TextInputType? inputType,
    bool? multiLine,
    VoidCallback? onTap,
    IconData? suffixIcon,
  }) =>
      FieldInfo(
        controller: controller ?? this.controller,
        required: required ?? this.required,
        prefixIcon: prefixIcon ?? this.prefixIcon,
        label: label ?? this.label,
        hint: hint ?? this.hint,
        inputType: inputType ?? this.inputType,
        multiLine: multiLine ?? this.multiLine,
        onTap: onTap ?? this.onTap,
        suffixIcon: suffixIcon ?? this.suffixIcon,
      );
}
