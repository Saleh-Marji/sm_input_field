import 'package:flutter/material.dart';
import 'package:sm_input_field/fields/input_field.dart';
import 'package:sm_input_field/models/field_info.dart';

class FormExampleScreen extends StatefulWidget {
  const FormExampleScreen({Key? key}) : super(key: key);

  @override
  State<FormExampleScreen> createState() => _FormExampleScreenState();
}

class _FormExampleScreenState extends State<FormExampleScreen> {
  final fieldInfos = {
    'Name': FieldInfo(initialValue: 'Saleh Marji', prefixIcon: Icons.label, required: true),
    'Description': FieldInfo.multiLine(prefixIcon: Icons.description),
    'Phone Number': FieldInfo(inputType: TextInputType.phone, prefixIcon: Icons.phone),
  };

  @override
  void dispose() {
    fieldInfos.forEach((key, value) => value.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...fieldInfos.entries.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: InputField.fromFieldInfo(
                e.value.copyWith(
                  label: e.key,
                  hint: 'Kindly enter the ${e.key.toLowerCase()}',
                ),
                borderColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
