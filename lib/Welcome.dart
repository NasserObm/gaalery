// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:gaalery/picture.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    // Définir un timer pour naviguer vers la prochaine page après 5 secondes
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Picture()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27282E),
      body: Stack(
        children: [
          Center(
            child: Text(
              'Galery',
              style: GoogleFonts.milonga(
                  fontSize: 55, color: const Color(0xffffffff)),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -100,
            child: Transform.rotate(
              angle: -120,
              child: SizedBox(
                  height: 350, child: Image.asset('assets/img/image.png')),
            ),
          )
        ],
      ),
    );
  }
}
