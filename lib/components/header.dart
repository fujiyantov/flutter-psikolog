import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Aplikasi Konsultasi',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14
      ),
    );
  }
}
