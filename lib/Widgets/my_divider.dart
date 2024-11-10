import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 30,
      endIndent: 30,
      color:  Colors.grey.shade500,
    );
  }
}
