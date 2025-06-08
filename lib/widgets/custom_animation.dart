import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
      return Lottie.asset('assets/lottie/$name.json',height: 300);
  }
}