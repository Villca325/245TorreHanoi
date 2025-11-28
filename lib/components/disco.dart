import 'package:flutter/material.dart';

class Disco extends StatelessWidget {
  final int ancho;
  const Disco({super.key,required this.ancho});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: Text("$ancho"),
      )
    );
  }
}