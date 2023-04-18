import 'package:example/screens/regular_fields_screen.dart';
import 'package:flutter/material.dart';

import 'form_example_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SM Input Field Example'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...<String, Widget>{
              'Regular Fields': const RegularFieldsScreen(),
              'Form Example': const FormExampleScreen(),
            }.entries.map(
                  (e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: MaterialButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => e.value)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text(
                        e.key,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
