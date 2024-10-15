import 'package:flutter/material.dart';
import 'package:gaalery/Welcome.dart';

void main() => runApp(const Galery());

class Galery extends StatelessWidget {
  const Galery({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Galery',
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
