import 'package:flutter/material.dart';
import 'package:torres_de_hanoi/classes/pilaCompleta.dart';

class DatosPila extends ChangeNotifier {
  late PilaCompleta pila1;
  late PilaCompleta pila2;
  late PilaCompleta pila3;
  DatosPila() {
    pila1 = PilaCompleta([10,9,8,7,6], 5);
    pila2 = PilaCompleta([], 5);
    pila3 = PilaCompleta([], 5);
  }
  void moverDisco(PilaCompleta origen, PilaCompleta destino, int valor) {
    origen.datosPila.removeLast();
    destino.datosPila.add(valor);
    
    notifyListeners(); // ← ESTO ACTUALIZA TODAS LAS PILAS
  }
  
  bool puedeAceptar(PilaCompleta destino, int valor) {
    if (destino.datosPila.isEmpty) {
      return true;
    }
    return valor < destino.datosPila.last;
  }
}