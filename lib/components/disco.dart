import 'package:flutter/material.dart';

class Disco extends StatelessWidget {
  final int ancho;
  const Disco({super.key,required this.ancho});
  static final Map<int,List<Color>>colores={
  6: [const Color(0xFFB2EBF2), const Color(0xFF4DD0E1)], 
    7: [const Color(0xFFE1BEE7), const Color(0xFFBA68C8)], 
    8: [const Color(0xFFBBDEFB), const Color(0xFF64B5F6)], 
    9: [const Color(0xFFC8E6C9), const Color(0xFF81C784)], 
    10: [const Color(0xFFFFE0B2), const Color(0xFFFFB74D)], 
    11: [const Color(0xFFFFCDD2), const Color(0xFFE57373)],
    12: [const Color(0xFFF0F4C3), const Color(0xFFDCE775)],
};
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho!=0?50+(ancho)*15:200,
      height: 35,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: AlignmentGeometry.topCenter,
          colors: colores[ancho]??[const Color.from(alpha: 0.1, red: 0.129, green: 0.588, blue: 0.953),const Color.from(alpha: 0.1, red: 0.129, green: 0.588, blue: 0.953)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: ancho!=0?Text("$ancho"):Text(""),
      )
    );
  }
}