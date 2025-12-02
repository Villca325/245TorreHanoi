import 'package:provider/provider.dart';
import 'package:torres_de_hanoi/components/pila_discos.dart';
import 'package:torres_de_hanoi/controller/estado_pilas.dart';
import 'package:torres_de_hanoi/classes/pilaCompleta.dart'; // Asegúrate de importar esto para PilaCompleta
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
    final datos = context.watch<DatosPila>();
    
    final size = MediaQuery.of(context).size;
    final alturaZonaJuego = size.height * 0.65;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        SizedBox(
          height: alturaZonaJuego,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Usamos una función auxiliar para no repetir código
              _construirTorre(datos.pila1, alturaZonaJuego),
              _construirTorre(datos.pila2, alturaZonaJuego),
              _construirTorre(datos.pila3, alturaZonaJuego),
            ],
          ),
        ),


        Container(
          height: 20, 
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[300], 
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withAlpha(204),
                Colors.grey.withAlpha(204),
                Colors.grey.shade600,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(76),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ]
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  
  Widget _construirTorre(PilaCompleta pila, double altura) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //El Tubo
        Container(
          width: 20, 
          height: altura - 5,
          decoration: BoxDecoration(
            color: Colors.lightBlue.withAlpha(200),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            border: Border.all(color: Colors.white.withAlpha(51), width: 1),
          ),
        ),
        PilaDiscos(pila: pila),
      ],
    );
  }
}