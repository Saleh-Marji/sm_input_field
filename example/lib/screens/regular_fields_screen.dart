import 'package:flutter/material.dart';
import 'package:sm_input_field/fields/input_field.dart';
import 'package:sm_input_field/fields/search_field.dart';

class RegularFieldsScreen extends StatelessWidget {
  const RegularFieldsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regular Fields Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const InputField(
            borderColor: Colors.purple,
            labelText: 'Example',
          ),
          const SizedBox(height: 20),
          SearchField(
            onChanged: (val) {
              debugPrint(val);
            },
          ),
        ],
      ),
    );
  }
}
