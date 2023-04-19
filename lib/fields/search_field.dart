import 'package:flutter/material.dart';
import '../utils/constants.dart';

import 'input_field.dart';

/// this field specifies some properties
class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.controller,
    this.onChanged,
    this.borderColor,
    this.inputType,
  }) : super(key: key);

  /// the controller of the search field
  final TextEditingController? controller;

  /// the onChanged of the search field
  final ValueChanged<String>? onChanged;

  /// the border color of the search field
  final Color? borderColor;

  ///the input type of the search field
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      onChanged: onChanged,
      hintText: 'Search',
      prefixIcon: Icons.search,
      borderColor: borderColor ?? kColorPurple,
      inputType: inputType,
    );
  }
}
