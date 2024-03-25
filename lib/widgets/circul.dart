import 'package:flutter/material.dart';

class Circul extends StatelessWidget {
  const Circul({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height / 3,
      child: const CircularProgressIndicator(),
    );
  }
}
