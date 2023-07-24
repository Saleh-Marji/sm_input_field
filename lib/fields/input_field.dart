import 'package:flutter/material.dart';

import '../models/field_info.dart';
import '../utils/constants.dart';

typedef InputDecorationBuilder = InputDecoration Function(InputDecoration inputDecoration);

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
    this.isObscure,
    this.maxLines,
    this.minLines,
    this.contentPadding,
    this.inputDecoration,
    this.fillColor,
    this.allTextStyle,
    this.textStyle,
    this.hintStyle,
    this.innerLabelStyle,
    this.labelStyle,
    this.labelIsBold,
    this.inputDecorationBuilder,
    this.borderRadius,
    this.focusNode,
  }) : super(key: key);

  ///This constructor takes a field info object for the main properties (used mostly for forms)
  factory InputField.fromFieldInfo(
    FieldInfo info, {
    double? labelFieldSpace,
    Color? borderColor,
    double? elevation,
    EdgeInsets? contentPadding,
    InputDecoration? inputDecoration,
    InputDecorationBuilder? inputDecorationBuilder,
    Color? fillColor,
    TextStyle? textStyle,
    TextStyle? allTextStyle,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? innerLabelStyle,
    bool? labelIsBold,
    BorderRadius? borderRadius,
    FocusNode? focusNode,
  }) =>
      InputField(
        controller: info.controller,
        hintText: info.hint,
        contentPadding: contentPadding,
        prefixIcon: info.prefixIcon,
        suffixIcon: info.suffixIcon,
        inputDecoration: inputDecoration,
        fillColor: fillColor,
        labelText: info.label == null
            ? null
            : '${info.label}${(info.required ?? false) ? (info.requiredString ?? ' (Required)') : ''}',
        inputType: info.inputType,
        isMultiline: info.multiLine,
        innerLabelText: info.innerLabel == null
            ? null
            : '${info.innerLabel}${((info.label == null && (info.required ?? false)) ? (info.requiredString ?? '*') : '')}',
        labelFieldSpace: labelFieldSpace ?? 10,
        borderColor: borderColor,
        elevation: elevation ?? 3,
        onTap: info.onTap,
        readOnly: info.readOnly,
        isObscure: info.isObscure,
        minLines: info.minLines,
        maxLines: info.maxLines,
        hintStyle: hintStyle,
        textStyle: textStyle,
        labelStyle: labelStyle,
        allTextStyle: allTextStyle,
        innerLabelStyle: innerLabelStyle,
        labelIsBold: labelIsBold,
        onChanged: info.onChanged,
        inputDecorationBuilder: inputDecorationBuilder,
        borderRadius: borderRadius,
        focusNode: focusNode,
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

  /// specifies min lines for multi-line fields
  final int? minLines;

  /// specifies max lines for multi-line fields
  final int? maxLines;

  /// specifies if the field input is obscured
  final bool? isObscure;

  /// specifies the keyboard type of the field
  final TextInputType? inputType;

  /// specifies if the field is read only
  final bool? readOnly;

  /// specifies the action to be taken when the field is tapped
  final VoidCallback? onTap;

  /// specifies content padding
  final EdgeInsets? contentPadding;

  /// optional custom decoration
  final InputDecoration? inputDecoration;

  /// optional custom decoration builder (to be used in order to copyWith the decoration)
  final InputDecorationBuilder? inputDecorationBuilder;

  /// customize the fill color of the field
  final Color? fillColor;

  /// customizes the style of the field text
  final TextStyle? textStyle;

  /// customizes the style of the inner label
  final TextStyle? innerLabelStyle;

  /// customizes the style of the hint
  final TextStyle? hintStyle;

  /// customizes the style of the label
  final TextStyle? labelStyle;

  /// customizes the all the styles of the text field with the label being bold if not canceled by [labelIsBold]
  final TextStyle? allTextStyle;

  /// specifies if the label should be bold
  final bool? labelIsBold;

  /// specifies borderRadius of the text field including the material widget (which gives shadow effect if elevation
  /// is not null)
  final BorderRadius? borderRadius;

  /// specifies the focus node of the text field
  final FocusNode? focusNode;

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
            child: Text(innerLabelText!, style: allTextStyle ?? innerLabelStyle ?? kTextStyleMain),
          )
      ];
      prefixIconWidget = Row(mainAxisSize: MainAxisSize.min, children: children);
    }
    var defaultInputDecoration = inputDecoration ??
        InputDecoration(
          filled: fillColor != null,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: allTextStyle ?? hintStyle,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
          prefixIcon: prefixIconWidget,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon!, size: 25),
          border: OutlineInputBorder(
            borderRadius: this.borderRadius ?? BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? kColorBlue),
            borderRadius: this.borderRadius ?? BorderRadius.circular(10),
          ),
        );

    if (inputDecorationBuilder != null) {
      defaultInputDecoration = inputDecorationBuilder!.call(defaultInputDecoration);
    }

    Widget widget = TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      style: allTextStyle ?? textStyle ?? kTextStyleMain,
      minLines: (isMultiline ?? false) ? minLines ?? 1 : 1,
      maxLines: (isMultiline ?? false) ? maxLines ?? 5 : 1,
      keyboardType: inputType,
      readOnly: readOnly ?? false,
      onTap: onTap,
      obscureText: isObscure ?? false,
      decoration: defaultInputDecoration,
    );


    BorderRadius? borderRadius;
    var border = defaultInputDecoration.border;
    if(border is OutlineInputBorder) {
      borderRadius = border.borderRadius;
    }

    if (elevation != null) {
      widget = Material(
        borderRadius: this.borderRadius ?? borderRadius ?? BorderRadius.circular(10),
        elevation: elevation!,
        color: Colors.transparent,
        child: widget,
      );
    }

    if (labelText != null) {
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: (allTextStyle ?? labelStyle ?? kTextStyleMain).copyWith(
              fontWeight: labelIsBold ?? true ? FontWeight.bold : null,
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
