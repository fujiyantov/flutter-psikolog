import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Application',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14
      ),
    );
  }
}
