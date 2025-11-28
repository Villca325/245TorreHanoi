// Archivo: estado_pilas.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:torres_de_hanoi/classes/pilaCompleta.dart';

class DatosPila extends ChangeNotifier {
  late PilaCompleta pila1;
  late PilaCompleta pila2;
  late PilaCompleta pila3;
  int mv = 0;
  int tp = 0;
  Timer? _timer;

  DatosPila({required int discosIniciales}) {
    List<int> discosInicialesList = List<int>.generate(
      discosIniciales,
          (i) => (discosIniciales - i) + 5,
    );

    pila1 = PilaCompleta(discosInicialesList, discosIniciales);
    pila2 = PilaCompleta([], discosIniciales);
    pila3 = PilaCompleta([], discosIniciales);

    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      tp++;
      notifyListeners();
    });
  }

  int get movimientos => mv;
  int get tiempo => tp;

  void moverDisco(PilaCompleta origen, PilaCompleta destino, int valor) {
    origen.datosPila.removeLast();
    destino.datosPila.add(valor);
    mv++;

    notifyListeners();
  }

  bool puedeAceptar(PilaCompleta destino, int valor) {
    if (destino.datosPila.isEmpty) {
      return true;
    }
    return valor < destino.datosPila.last;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}