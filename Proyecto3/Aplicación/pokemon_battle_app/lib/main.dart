import 'package:flutter/material.dart';
import 'screens/SelectionScreen.dart'; 
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Pokemon Battle',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MenuInicio(),
    );
  }
}

class MenuInicio extends StatefulWidget {
  const MenuInicio({super.key});

  @override
  State<MenuInicio> createState() => _MenuInicioState();
}

class _MenuInicioState extends State<MenuInicio> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Iniciamos la música al cargar la pantalla
    _iniciarMusica("music/musica_inicio.mp3");
  } 

  // Esta función estaba mal cerrada antes. Ahora está corregida.
  void _iniciarMusica(String assetPath) async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource(assetPath));
  } 

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/menu_fondo.webp', 
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.red[900], 
              ),
            ),
          ),
          
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), 
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "POKEMON BATTLE",
                  style: TextStyle(
                    fontSize: 40, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 15.0, 
                        color: Colors.cyanAccent,
                        offset: Offset(0.0, 0.0), 
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 50),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    backgroundColor: Colors.pinkAccent, 
                    foregroundColor: Colors.black,
                    elevation: 10, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.pink.withOpacity(0.8), 
                  ),
                  child: const Text(
                    "INICIAR PARTIDA", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  onPressed: () async {
                    await _audioPlayer.stop();
                    if (!context.mounted) return;
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectionScreen(),
                      ),
                    ).then((_) {
                      _iniciarMusica("music/musica_menu.mp3");
                    });
                  },
                ),
                const SizedBox(height: 20),
              
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    backgroundColor: Colors.transparent, 
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.cyanAccent, width: 2), 
                    ),
                    shadowColor: Colors.cyan.withOpacity(0.8), 
                  ),
                  child: const Text(
                    "CRÉDITOS", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreditosScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreditosScreen extends StatelessWidget {
  const CreditosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: const Text("Créditos del Juego", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "DESARROLLO Y LÓGICA",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent, 
                  shadows: [
                    Shadow(blurRadius: 10.0, color: Colors.cyan, offset: Offset(0, 0)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'POO - Equipo 5\n\n Integrantes: \n Bernal de la O Sofia Citlali\nGarcia Novoa Mario\n Miranda Sanchez Luis Eduardo \nRodriguez Trejo Fernanda Ivonne\nRoman Ramos Maria Fernanda ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                "Desarrollo de la Interfaz:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent, 
                  shadows: [
                    Shadow(blurRadius: 10.0, color: Colors.pink, offset: Offset(0, 0)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Asistencia de IA Gemini",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}