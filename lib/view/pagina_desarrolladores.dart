import 'package:flutter/material.dart';
import 'base.dart';

class PaginaDesarrolladores extends StatelessWidget {
  const PaginaDesarrolladores({super.key});

  @override
  Widget build(BuildContext context) {
    return paginaBase(
      titulo: "Desarrolladores",
      botonBack: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      contenido: Column(
        
        children: [
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50),
                tarjeta(
                  nombre: "Elizeo Condori", 
                  rol: "Programador", 
                  rutaImagen: ""
                ),
                tarjeta(
                  nombre: "Joel Flores", 
                  rol: "UI designer", 
                  rutaImagen: "assets/images/desarrollador2.png"
                ),
                tarjeta(
                  nombre: "Hernan Laruta", 
                  rol: "a", 
                  rutaImagen: ""
                ),
                tarjeta(
                  nombre: "Dylan Salazar", 
                  rol: "b", 
                  rutaImagen: ""
                ),
                tarjeta(
                  nombre: "Franco Villavicencio", 
                  rol: "c", 
                  rutaImagen: ""
                ),
                tarjeta(
                  nombre: "Randoll Villca", 
                  rol: "d", 
                  rutaImagen: ""
                ),
                SizedBox(width: 50),
              ]
            ),
          ),
        const Text(
                "Todos los derechos reservados desde 2025",
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



  Widget tarjeta({
  required String nombre, 
  required String rol, 
  required String rutaImagen
}) {
  return Card(
    elevation: 4, 
    margin: const EdgeInsets.all(10), 
    child: Container(
      width: 150, 
      padding: const EdgeInsets.all(10), 
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          if (rutaImagen.isNotEmpty)
            Image.asset(
              rutaImagen,
              width: 80,
              height: 80,
              fit: BoxFit.cover, 
            )
          else
            const Icon(
              Icons.person,
              size: 80,
              color: Colors.grey,
            ),
          
          const SizedBox(height: 10), 
          
          Text(
            nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          

          Text(
            "Todos los derechos reservados ManadaCORP 2025",
            textAlign: TextAlign.center, // Fuerza el centro del texto
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
}
