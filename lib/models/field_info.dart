import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///This is a class to simplify the creation of a form (shown in the examples section)

class FieldInfo {
  ///The TextEditingController specific for the field of the FieldInfo
  TextEditingController controller;

  ///The hint shown in the field
  String? hint;

  /// The label shown above the field in bold
  String? label;

  /// The label shown inside the field to the right of the prefix icon
  String? innerLabel;

  /// The prefix icon shown in the field
  IconData? prefixIcon;

  /// The suffix icon shown in the field
  IconData? suffixIcon;

  /// The keyboard type of the field
  TextInputType? inputType;

  /// specifies if the field is multiline or not
  bool? multiLine;

  /// specifies min lines for multi-line fields
  int? minLines;

  /// specifies max lines for multi-line fields
  int? maxLines;

  /// specifies if the field is required or not
  /// if true, a (Required) is concatenated to the label
  /// Example: a field with label 'Name'
  /// required: true ===> 'Name (Required)'
  /// required: false ===> 'Name'
  /// if the label is null and the inner label is not null
  /// an asterisk will be concatenated to the inner label
  bool? required;

  /// specifies what is concatenated to the string if it is required
  String? requiredString;

  /// specifies if the field is read only
  bool? readOnly;

  /// specifies the action to be performed if the field is tapped
  VoidCallback? onTap;

  /// specifies the action to be performed if the outside of the field is tapped
  void Function(PointerDownEvent pointerDownEvent)? onTapOutside;

  /// specifies if the field input is obscured
  bool? isObscure;

  /// specifies the onChanged method
  void Function(String input)? onChanged;

  /// specifies the validator of the form field
  final FormFieldValidator<String>? validator;

  /// specifies the formatters of the form field
  final List<TextInputFormatter>? inputFormatters;

  FieldInfo({
    TextEditingController? controller,
    String? initialValue,
    this.required,
    this.requiredString,
    this.prefixIcon,
    this.label,
    this.innerLabel,
    this.hint,
    this.inputType,
    this.multiLine,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.isObscure,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.onTapOutside,
  }) : controller = controller ?? TextEditingController(text: initialValue);

  /// a named constructor that
  factory FieldInfo.multiLine({
    TextEditingController? controller,
    String? initialValue,
    String? hint,
    String? innerLabel,
    String? label,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool? required,
    bool? isObscure,
    String? requiredString,
    bool? readOnly,
    VoidCallback? onTap,
    void Function(PointerDownEvent pointerDownEvent)? onTapOutside,
    int? minLines,
    int? maxLines,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    void Function(String input)? onChanged,
  }) =>
      FieldInfo(
        controller: controller,
        initialValue: initialValue,
        multiLine: true,
        inputType: TextInputType.multiline,
        hint: hint,
        label: label,
        innerLabel: innerLabel,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        required: required,
        readOnly: readOnly,
        onTap: onTap,
        onTapOutside: onTapOutside,
        isObscure: isObscure,
        requiredString: requiredString,
        maxLines: maxLines,
        minLines: minLines,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatters,
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
    String? initialValue,
    bool? required,
    String? requiredString,
    IconData? prefixIcon,
    String? label,
    String? hint,
    String? innerLabel,
    TextInputType? inputType,
    bool? multiLine,
    bool? isObscure,
    VoidCallback? onTap,
    void Function(PointerDownEvent pointerDownEvent)? onTapOutside,
    bool? readOnly,
    IconData? suffixIcon,
    int? minLines,
    int? maxLines,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    void Function(String input)? onChanged,
  }) =>
      FieldInfo(
        controller: controller ?? this.controller,
        required: required ?? this.required,
        requiredString: requiredString ?? this.requiredString,
        prefixIcon: prefixIcon ?? this.prefixIcon,
        label: label ?? this.label,
        innerLabel: innerLabel ?? this.innerLabel,
        hint: hint ?? this.hint,
        inputType: inputType ?? this.inputType,
        multiLine: multiLine ?? this.multiLine,
        onTap: onTap ?? this.onTap,
        onTapOutside: onTapOutside ?? this.onTapOutside,
        isObscure: isObscure ?? this.isObscure,
        readOnly: readOnly ?? this.readOnly,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        minLines: minLines ?? this.minLines,
        maxLines: maxLines ?? this.maxLines,
        onChanged: onChanged ?? this.onChanged,
        validator: validator ?? this.validator,
        inputFormatters: inputFormatters ?? this.inputFormatters,
        initialValue: initialValue,
      );
}
