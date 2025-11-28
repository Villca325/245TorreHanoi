import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/pagina_desarrolladores.dart';
import 'view/pagina_menu.dart';
import 'view/pagina_niveles.dart';
import 'view/pagina_gameplay.dart';
import 'view/pagina_reglas.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_){
    runApp(const MyApp());
  });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torre Hanoi',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const PaginaMenu(),
        '/niveles': (_) => const PaginaNiveles(),
        '/gameplay': (_) => const PaginaGameplay(),
        '/desarrolladores': (_) => const PaginaDesarrolladores(),
        '/reglas': (_) => const PaginaReglas(),
      },
    );
  }
}
