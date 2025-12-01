import 'package:flutter/material.dart';
import 'base.dart'; 


class PaginaReglas extends StatelessWidget {
  const PaginaReglas({super.key});

  @override
  Widget build(BuildContext context) {
    return paginaBase(
      titulo: "Reglas",
      botonBack: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      contenido: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            

            Image.asset(
                  'assets/images/reglas.png',
                  width: 200,
                  fit: BoxFit.cover,
                ),

            const SizedBox(height: 25),


            const Text(
              "¿Cómo jugar?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            
            const SizedBox(height: 5),
            
            const Text(
              "Domina la lógica de la torre",
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),

            const SizedBox(height: 25),

            // --- CAJA DE REGLAS ---
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(

                color: Colors.black26, 
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10), // Borde sutil
              ),
              child: Column(
                children: [
                  _itemRegla(Icons.emoji_objects, "Objetivo",
                    "Mueve todos los discos desde la torre inicial hasta la torre final."),
                  
                  _divider(),

                  _itemRegla(Icons.pan_tool_alt, "Movimientos", 
                    "Solo puedes mover un disco a la vez."),

                  _divider(),

                  _itemRegla(Icons.block, "Restricción", 
                    "Nunca coloques un disco grande sobre uno más pequeño."),

                  _divider(),

                  _itemRegla(Icons.timer, "Puntuación", 
                    "El tiempo y los movimientos cuentan. ¡Intenta lograr el mínimo (2^n - 1)!"),
                  
                  _divider(),

                  _itemRegla(Icons.refresh, "Reiniciar", 
                    "Si te atascas, puedes reiniciar el nivel para mejorar tu estrategia."),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            Text(
              "Todos los derechos reservados ManadaCORP 2025",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          
        ),
      ),
    );
  }

  // --- WIDGET AUXILIAR PARA LAS LÍNEAS DIVISORIAS ---
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Divider(color: Colors.white24, height: 1),
    );
  }

  // --- WIDGET AUXILIAR PARA CADA REGLA ---
  Widget _itemRegla(IconData icono, String titulo, String descripcion) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // El Icono
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icono, color: Colors.amberAccent, size: 24),
        ),
        
        const SizedBox(width: 15),
        
        // El Texto
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                descripcion,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}