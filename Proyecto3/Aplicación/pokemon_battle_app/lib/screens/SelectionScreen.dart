import 'package:flutter/material.dart';
import '../logic/Instancias.dart';
import '../logic/Base.dart';
import '../logic/SistemaBatalla.dart';
import 'ItemSelectionScreen.dart';
import 'package:audioplayers/audioplayers.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  PokemonBatalla? jugadorSeleccionado;
  PokemonBatalla? rivalSeleccionado;
  PokemonBatalla? pokemonEnFoco; 

  final AudioPlayer _audioPlayer=AudioPlayer();

  @override
  void initState() {
    super.initState();
    _iniciarMusica('music/musica_seleccion.mp3'); 
  }
  
  void _iniciarMusica(String assetPath) async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource(assetPath));
  }

  void reiniciar() {
    setState(() {
      jugadorSeleccionado = null;
      rivalSeleccionado = null;
      pokemonEnFoco = null;
    });
  }

  void seleccionarPokemon(PokemonBatalla pokemon) {
    setState(() {
      pokemonEnFoco = pokemon; 

      if (pokemon == jugadorSeleccionado) {
        jugadorSeleccionado = null;
      } else if (pokemon == rivalSeleccionado) {
        rivalSeleccionado = null;
      } else if (jugadorSeleccionado == null) {
        jugadorSeleccionado = pokemon;
      } else if (rivalSeleccionado == null) {
        rivalSeleccionado = pokemon;
      }

    });
  }

  void irALaBatalla() async{
    if (jugadorSeleccionado != null && rivalSeleccionado != null) {
      await _audioPlayer.stop();

      
      
      jugadorSeleccionado!.vida = jugadorSeleccionado!.vidaMax;
      rivalSeleccionado!.vida = rivalSeleccionado!.vidaMax;
      jugadorSeleccionado!.estadoActual = EstadoCondicion.normal;
      rivalSeleccionado!.estadoActual = EstadoCondicion.normal;

      List<Item> misItems = [pocion, superPocion, antidoto, antiquemar, despertar, antiparalisis];
      List<Item> itemsRival = [hiperPocion, antidoto];

      Batalla batalla = Batalla(
        jugador: jugadorSeleccionado!,
        rival: rivalSeleccionado!,
        itemsUsuario: misItems,
        itemsRivalBase: itemsRival,
      );
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemSelectionScreen(
          jugadorSeleccionado: jugadorSeleccionado!,
          rivalSeleccionado: rivalSeleccionado!,
        ),
      ),
    ).then((_) {
      _iniciarMusica('music/musica_seleccion.mp3'); 
    });
  }
}

@override
void dispose() {
  _audioPlayer.stop();
  _audioPlayer.dispose();
  super.dispose();
}
      
  
void _mostrarTablaEfectividad(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "Tabla de Efectividad",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.cyanAccent),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.asset(
                'assets/images/tabla_efectividad.png', 
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Text(
                  "No se pudo cargar la imagen de la tabla.",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              // -------------------------
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Cerrar"),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50), 
      appBar: AppBar(
        title: const Text("Selección de Personajes", style: TextStyle(color: Colors.white)),
         
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon:const Icon(Icons.table_chart_outlined,color: Colors.white),
            onPressed: () => _mostrarTablaEfectividad(context),
            tooltip: "Ver Tabla de Efectividad"
          ),

          IconButton(
            icon: const Icon(Icons.refresh), 
            onPressed: reiniciar, 
            tooltip: "Reiniciar Selección"
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(
              flex: 5, 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "SELECCIONA TUS POKÉMON",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white12, thickness: 1, indent: 20, endIndent: 20),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(4), 
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 17, 
                          crossAxisSpacing: 3, 
                          mainAxisSpacing: 4, 
                          childAspectRatio: 1.0, 
                        ),
                        itemCount: pokedexGlobal.length,
                        physics: const NeverScrollableScrollPhysics(), 
                        itemBuilder: (context, index) {
                          final poke = pokedexGlobal[index];
                          return _buildPokemonGridItem(poke);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              flex: 4, 
              child: Row(
                children: [
                  // pokemon jugador
                  Expanded(
                    flex: 3, 
                    child: _buildPanelLateral(
                      pokemon: jugadorSeleccionado,
                      label: "JUGADOR ",
                      color: Colors.greenAccent,
                      esJugador: true,
                    ),
                  ),
      
                  const SizedBox(width: 8),

                  //boton batalla
                  Expanded(
                    flex: 3,
                    child: _buildBotonBatalla(), 
                  ),

                  const SizedBox(width: 8),

                  //pokemon rival
                  Expanded(
                    flex: 3, 
                    child: _buildPanelLateral(
                      pokemon: rivalSeleccionado,
                      label: "RIVAL",
                      color: Colors.redAccent,
                      esJugador: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildPokemonGridItem(PokemonBatalla poke) {
    bool esJugador = poke == jugadorSeleccionado;
    bool esRival = poke == rivalSeleccionado;
    Color bordeColor = Colors.grey[800]!;
    double grosor = 1;
    
    if (esJugador) {
      bordeColor = Colors.greenAccent;
      grosor = 4;
    } else if (esRival) {
      bordeColor = Colors.redAccent;
      grosor = 4;
    } else if (poke == pokemonEnFoco) {
      bordeColor = Colors.blueAccent; 
      grosor = 2;
    }

    return GestureDetector(
      onTap: () => seleccionarPokemon(poke),
      onTapDown: (_) => setState(() => pokemonEnFoco = poke),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: bordeColor, width: grosor),
          boxShadow: [
            if (esJugador || esRival)
              BoxShadow(
                color: bordeColor.withOpacity(0.6), 
                blurRadius: 10, 
                spreadRadius: 1
              )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            'assets/images/${poke.nombre.toLowerCase()}.png',
            fit: BoxFit.contain,
            errorBuilder: (c,e,s) => const Icon(Icons.help_outline, color: Colors.white24, size: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildPanelLateral({
    required PokemonBatalla? pokemon, 
    required String label, 
    required Color color, 
    required bool esJugador
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.4), width: 2),
        boxShadow: [
          if (pokemon != null) 
            BoxShadow(
              color: color.withOpacity(0.4), 
              blurRadius: 20, 
              spreadRadius: 2
            )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color, 
              fontSize: 16, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1.5
            ),
          ),
          
          const Divider(color: Colors.white12, height: 10),

          if (pokemon == null) 
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(esJugador ? Icons.person : Icons.computer, size: 40, color: color.withOpacity(0.5)),
                  const SizedBox(height: 5),
                  Text("Seleccionar", style: TextStyle(color: color.withOpacity(0.7), fontSize: 12)),
                ],
              ),
            )
          else 
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/${pokemon.nombre.toLowerCase()}.png',
                      fit: BoxFit.contain,
                      errorBuilder: (c,e,s) => const Icon(Icons.pets, size: 50, color: Colors.white24),
                    ),
                  ),

                  Text(
                    pokemon.nombre.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: _getColorTipo(pokemon.tipo),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text(pokemon.tipo, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),

                  _buildBar("HP", pokemon.vidaMax.toDouble(), 500, Colors.green),
                  _buildBar("VEL", pokemon.velocidad.toDouble(), 150, Colors.blueAccent),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBar(String label, double valor, double max, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: valor / max,
                backgroundColor: Colors.black38,
                color: color,
                minHeight: 8,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(valor.toInt().toString(), style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBotonBatalla() {
    bool listos = (jugadorSeleccionado != null && rivalSeleccionado != null);
    String textoBoton = "¡BATALLA!";
    Color colorFondo = Colors.redAccent;

    if (jugadorSeleccionado == null) {
        textoBoton = "ELIGE JUGADOR";
        colorFondo = Colors.grey;
    } else if (rivalSeleccionado == null) {
        textoBoton = "ELIGE RIVAL";
        colorFondo = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: listos ? Colors.redAccent : colorFondo, 
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: listos ? irALaBatalla : null,
            icon: Icon(listos ? Icons.flash_on : Icons.arrow_right_alt, size: 28),
            label: Text(
              textoBoton,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
  
  Color _getColorTipo(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'fire': return Colors.orange;
      case 'water': return Colors.blue;
      case 'grass': return Colors.green;
      case 'electric': return Colors.yellow[700]!;
      case 'rock': return Colors.brown;
      case 'psychic': return Colors.purple;
      case 'ghost': return Colors.indigo;
      case 'dragon': return Colors.deepPurple;
      case 'steel': return Colors.blueGrey;
      default: return Colors.grey;
    }
  }
}