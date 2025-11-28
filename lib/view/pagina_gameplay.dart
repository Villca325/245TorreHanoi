import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torres_de_hanoi/controller/estado_pilas.dart';
import 'package:torres_de_hanoi/components/conjunto_pilas.dart';
import 'base.dart';


class PaginaGameplay extends StatefulWidget {
  const PaginaGameplay({super.key});

  @override
  State<PaginaGameplay> createState() => _PaginaGameplayState();
}

class _PaginaGameplayState extends State<PaginaGameplay> {

  @override
  Widget build(BuildContext context) {
    final datos = context.watch<DatosPila>();

    return paginaBase(
      botonBack: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      contenido: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    "Movimientos: ${datos.movimientos}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    "Tiempo: ${datos.tiempo} s",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const ConjuntoPilas(),
          ],
        ),
      ),
    );
  }
}