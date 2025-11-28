import 'package:flutter/material.dart';
import 'base.dart';

class PaginaMenu extends StatelessWidget {
  const PaginaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return paginaBase(

      contenido: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              Image.asset(
                'assets/images/TorreHannoi.png',
                width: 330,
                height: 330,
              ),
          
              const SizedBox(width: 70),
          
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Torre de Hanoi",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(320, 60),
                      backgroundColor: const Color(0xFFff6b9d),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/niveles'),
                    child: const Text("Jugar", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  
                  
          
                  const SizedBox(height: 10),
          
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 60),
                            backgroundColor: const Color(0xFF7c3aed),
                          ),
                          onPressed: () => Navigator.pushNamed(context, '/desarrolladores'),
                          child: const Text("Desarrolladores", style: TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      
                                
                      const SizedBox(width: 10),

                      ElevatedButton.icon( 
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 60),
                          backgroundColor: const Color(0xFFfbbf24),
                          alignment: Alignment.center, 
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/reglas'),
                        icon: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 24), 
                        label: const Text(
                          "Reglas", 
                          style: TextStyle(color: Colors.white, fontSize: 15)
                        ),
                      ),
                                
                      
                    ],
                  ),
                ],
              ),
          
          
              
            ],
          ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0), // Un poco de margen abajo
          child: Text(
            "Todos los derechos reservados ManadaCORP 2025",
            textAlign: TextAlign.center, // Fuerza el centro del texto
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        ],
      ),
      
    );
    
  }
}
