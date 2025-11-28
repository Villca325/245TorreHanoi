import 'package:flutter/material.dart';
import 'base.dart';

class PaginaNiveles extends StatelessWidget {
  const PaginaNiveles({super.key});

  @override
  Widget build(BuildContext context) {
    return paginaBase(
      titulo: "Niveles",
      botonBack: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      contenido: Column(
        children: [
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 40),
                nivelItem(context, "Nivel 1", [const Color(0xFFB2EBF2), const Color(0xFF4DD0E1)]),
                const SizedBox(width: 20),

                nivelItem(context, "Nivel 2", [const Color(0xFFE1BEE7), const Color(0xFFBA68C8)]),
                const SizedBox(width: 20),

                nivelItem(context, "Nivel 3", [const Color(0xFFBBDEFB), const Color(0xFF64B5F6)]),
                const SizedBox(width: 20),

                nivelItem(context, "Nivel 4", [const Color(0xFFC8E6C9), const Color(0xFF81C784)]),
                const SizedBox(width: 20),

                nivelItem(context, "Nivel 5", [const Color(0xFFFFE0B2), const Color(0xFFFFB74D)]),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Todos los derechos reservados ManadaCORP 2025",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  Widget nivelItem(BuildContext context, String titulo, List<Color> colores) {

    final nivelNumero = int.tryParse(titulo.split(' ').last) ?? 1;

    final numeroDiscos = nivelNumero + 2;

    return Center(
      child: SizedBox(
        width: 170,
        height: 170,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/gameplay',
              arguments: numeroDiscos,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colores,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "$titulo\n($numeroDiscos Discos)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}