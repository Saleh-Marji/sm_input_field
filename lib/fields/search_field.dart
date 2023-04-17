import 'package:flutter/material.dart';
import 'package:sm_input_field/utils/constants.dart';

import 'input_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.controller,
    this.onChanged,
    this.borderColor,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      onChanged: onChanged,
      hintText: 'Search',
      prefixIcon: Icons.search,
      borderColor: borderColor ?? kColorPurple,
    );
  }
}
