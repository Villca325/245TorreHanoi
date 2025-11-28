import 'package:provider/provider.dart';
import 'package:torres_de_hanoi/components/pila_discos.dart';
import 'package:torres_de_hanoi/controller/estado_pilas.dart';
import 'package:flutter/material.dart';

class ConjuntoPilas extends StatelessWidget {
  const ConjuntoPilas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MiDraggable();
  }
}
class MiDraggable extends StatefulWidget {
  const MiDraggable({super.key});
  @override
  State<MiDraggable> createState() => _MiDraggableState();
}

class _MiDraggableState extends State<MiDraggable> {
  @override
  Widget build(BuildContext context) {
    final datos=context.watch<DatosPila>();
    return Container(
      height: (76*datos.pila1.maximo*1.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PilaDiscos(pila: datos.pila1),
          PilaDiscos(pila: datos.pila2),
          PilaDiscos(pila: datos.pila3)
        ],
      )
    );
  }
}