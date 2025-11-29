import 'package:torres_de_hanoi/classes/pilaCompleta.dart';
import 'package:torres_de_hanoi/components/disco.dart';
import 'package:torres_de_hanoi/controller/estado_pilas.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PilaDiscos extends StatefulWidget {
  final PilaCompleta pila;
  const PilaDiscos({required this.pila,super.key});

  @override
  State<PilaDiscos> createState() => _PilaDiscosState();
}

class _PilaDiscosState extends State<PilaDiscos> {
  late PilaCompleta pilaMutable;
  @override
  void initState(){
    super.initState();
    pilaMutable=widget.pila;
  }
  @override
  Widget build(BuildContext context) {
    context.watch<DatosPila>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if(pilaMutable.maximo!=pilaMutable.datosPila.length)
          DragTarget<Map<String,dynamic>>(builder: (context,List<dynamic> aceptado,List<dynamic> rechazado){
              return Disco(ancho: 0);
            },
          onWillAcceptWithDetails: (data){
            final valor=data.data["valor"];
            final provider=context.read<DatosPila>();
            return provider.puedeAceptar(pilaMutable, valor);
          },
            onAcceptWithDetails: (data) {
              final pilaOrigen = data.data["pila"] as PilaCompleta;
              final valor = data.data["valor"];
              final provider = context.read<DatosPila>();

              provider.moverDisco(pilaOrigen, pilaMutable, valor);
              provider.comprobarGanado(context);
            },
          ),
        if(pilaMutable.datosPila.isNotEmpty)
          Draggable(
            data:{
              "pila":pilaMutable,
              "valor":pilaMutable.datosPila.last
            },
            feedback: Material(
              color: Colors.transparent,
              child: Disco(ancho: pilaMutable.datosPila.last),
            ), 
            childWhenDragging: Disco(ancho: 0),
            child: Disco(ancho: pilaMutable.datosPila.last,),              
          ),
        for(int i=pilaMutable.datosPila.length-2;i>=0;i--)
          Disco(ancho: pilaMutable.datosPila[i],),
      ],
    );
  }
}