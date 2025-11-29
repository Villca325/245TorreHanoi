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
    if (destino.datosPila.isEmpty) return true;
    return valor < destino.datosPila.last;
  }

  Future<void> comprobarGanado(BuildContext context) async {
    if (pila3.datosPila.length == pila3.maximo) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          title: const Text("GANASTE", style: TextStyle(color: Colors.white)),
          content: Text(
            "Movimientos: $mv\nTiempo: ${tp}s",
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              child: const Text("Reiniciar", style: TextStyle(color: Colors.red)),
              onPressed: () {
                reiniciar();
                Navigator.pop(context);
              },
            ),
            if(pila3.maximo!=6)
              TextButton(
              child: const Text("Siguiente Nvl", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/gameplay',
                  arguments: pila3.maximo+1,
                );
              },
            ),
            if(pila3.maximo==6)
              TextButton(
              child: const Text("Niveles", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pushNamed(
                context,
                    '/niveles'
                );
              },
            ),
          ],
        ),
      );
    }
  }

  void reiniciar() {
    final discos = pila1.maximo;

    mv = 0;
    tp = 0;

    List<int> discosInicialesList = List<int>.generate(
      discos,
          (i) => (discos - i) + 5,
    );

    pila1.datosPila.clear();
    pila2.datosPila.clear();
    pila3.datosPila.clear();

    pila1.datosPila.addAll(discosInicialesList);

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
