import 'package:flutter/material.dart';
import 'base.dart';

class PaginaGameplay extends StatelessWidget {
  const PaginaGameplay({super.key});

  @override
  Widget build(BuildContext context) {
    return paginaBase(
      botonBack: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      contenido: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(width:160, child: Text("Movimientos: 0", style: TextStyle(color: Colors.white, fontSize: 18))),
              SizedBox(width:160, child: Text("Tiempo: 0s", style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Icon(Icons.account_tree_rounded, size: 150, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
