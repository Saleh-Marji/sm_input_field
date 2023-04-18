

This package gives a simple api to create relatively simple and beautiful text fields

## Features

Gives you the ability to create an input field in a simple and easy manner

It also allows you to create forms fast and easy (check the example project)

## Usage

```dart
import 'package:sm_input_field/sm_input_field.dart';

class Field extends StatelessWidget {
  const Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      //specify the properties here
      controller: controller,
      labelText: 'Label',
      //...
    );
  }
}


class SearchInputField extends StatelessWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField();
  }
}


class FieldFromInfo extends StatelessWidget {
  const FieldFromInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField.fromFieldInfo(FieldInfo(
      //put here the desired properties
      label: 'Label',
      hint: 'Hint',
      //...
    ),
    // There are a few other properties specific for styling and colors specify them here!
      borderColor: Colors.blue,
      //...
    );
  }
}

```

## Additional information

for more details on each field see the api section

check out the example project for more details on examples
