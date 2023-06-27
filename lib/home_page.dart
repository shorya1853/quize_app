import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   const HomePage(this.switchwidget, {super.key});

  final void Function() switchwidget;

  @override
  Widget build(context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/image.png', height: 200),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text('Learn Flutter in fun way!', style: TextStyle(fontSize: 20)),
        ),
         ElevatedButton(onPressed: switchwidget, child: const Text('Start Learning', style: TextStyle(fontSize: 18)))
      ],
    ));
  }
}
