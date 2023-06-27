import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.onTap, required this.answer});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(141, 33, 149, 243),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onTap,
      child: Text(answer),
    );
  }
}
