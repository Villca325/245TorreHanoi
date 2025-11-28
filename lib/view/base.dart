import 'package:flutter/material.dart';

const Color colorFondoOscuro = Color.fromARGB(255, 14, 28, 130);
const Color colorFondoClaro = Color(0xFF3d2a6b);

Widget paginaBase({
  String? titulo,
  required Widget contenido,
  Widget? botonBack,
}) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [colorFondoOscuro, colorFondoClaro],
        ),
      ),
      child: SafeArea(
        // CAMBIO CLAVE: Usamos Stack para que el botón sea independiente
        child: Stack(
          children: [
            // CAPA 1: Estructura Vertical (Barra de título + Contenido)
            Column(
              children: [
                // La barra de fondo SOLO se dibuja si hay un título explícito
                if (titulo != null)
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(10, 43, 48, 87),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),

                // El contenido ocupa el resto del espacio
                Expanded(
                  child:SingleChildScrollView(
                    child: contenido,
                  ),
                ),
              ],
            ),

            // CAPA 2: Botón Flotante (Independiente)
            // Se dibuja encima de todo, sin importar si hay barra o no
            if (botonBack != null)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: botonBack,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}