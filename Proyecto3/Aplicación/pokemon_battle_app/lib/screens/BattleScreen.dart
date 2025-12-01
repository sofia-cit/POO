import 'package:flutter/material.dart';
import '../logic/Base.dart';
import '../logic/SistemaBatalla.dart';

enum MenuBatalla { Ataque, Item }

class BattleScreen extends StatefulWidget {
  final Batalla batalla;

  const BattleScreen({super.key, required this.batalla});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  
  String mensajeLog = "¡La batalla ha comenzado! Elige un ataque";

  MenuBatalla _menuActual = MenuBatalla.Ataque;


  void realizarAtaque(Ataque ataque) {
    if (!widget.batalla.enCurso) return;

    setState(() {
      _menuActual = MenuBatalla.Ataque;
    });

    setState(() {
      List<String> resultados = widget.batalla.ejecutarTurnoJugador(ataque);
      
      mensajeLog = resultados.join("\n");

      if (!widget.batalla.enCurso) {
        mostrarFinBatalla();
      }
    });
  }

  void usarItem(Item item) {
    if (!widget.batalla.enCurso) return;

    PokemonBatalla objetivo = widget.batalla.jugador; 

    setState(() {
      List<String> resultados = widget.batalla.ejecutarTurnoJugadorItem(item, objetivo);
      
      mensajeLog = resultados.join("\n");

      if (!widget.batalla.enCurso) {
        mostrarFinBatalla();
      }
      
      _menuActual = MenuBatalla.Ataque;
    });
  }

  void mostrarFinBatalla() {
    bool ganoJugador = widget.batalla.jugador.vida > 0;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(ganoJugador ? "¡Victoria!" : "Derrota"),
        content: Text(ganoJugador 
            ? "Has derrotado a ${widget.batalla.rival.nombre}." 
            : "${widget.batalla.rival.nombre} te ha debilitado."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              Navigator.pop(context); 
            },
            child: const Text("Volver al Menú"),
          ),
        ],
      ),
    );
  }

  

  Widget construirImagenPokemon(String nombre, bool esRival) {
    String nombreArchivo = nombre.toLowerCase().trim();
    
    return Image.asset(
      'assets/images/$nombreArchivo.png',
      width: 150,
      height: 150,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.pets, 
          size: 100, 
          color: esRival ? Colors.red[300] : Colors.green[300]
        );
      },
    );
  }

  Widget barraDeVida(PokemonBatalla pokemon, Color colorBarra) {
    double porcentaje = pokemon.vida / pokemon.vidaMax;
    if (porcentaje < 0) porcentaje = 0; 

    Color vidaActualColor;
    if(porcentaje>0.5) {
      vidaActualColor=Colors.lightGreenAccent[400]!;
      }else if(porcentaje>0.2){
        vidaActualColor=Colors.yellowAccent[400]!;
      }else{
        vidaActualColor=Colors.pinkAccent;
      }
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${pokemon.nombre} ",
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16,
            color:Colors.cyanAccent,
            shadows: [
              Shadow(
                color: Colors.cyan,
                blurRadius: 4.0
              ),
            ]
            ),
        ),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          value: porcentaje,
          color: vidaActualColor,
          backgroundColor:Colors.black54,
          minHeight: 12,
        ),
        Text(
          "${pokemon.vida.toInt()} / ${pokemon.vidaMax.toInt()} HP",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),

        if (pokemon.estadoActual != EstadoCondicion.normal)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: _getColorPorEstado(pokemon.estadoActual), 
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text(
              pokemon.estadoActual.name.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }


  Widget _buildMenuAtaques(PokemonBatalla jugador) {
    return Column(
      children: [
        const Text("Elige tu movimiento:", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: jugador.misAtaques.map((ataque) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _getColorPorTipo(ataque.tipoAtaque),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
                onPressed: widget.batalla.enCurso 
                    ? () => realizarAtaque(ataque) 
                    : null,
                child: Text(ataque.nombreAtaque, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(List<Item> itemsUsuario) {
    if (itemsUsuario.isEmpty) {
      return const Center(
        child: Text(
          "No te quedan items disponibles.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );
    }
    
    return Column(
      children: [
        const Text("Elige un Item para usar:", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: itemsUsuario.map((item) {
              bool isDisabled = item is CuradorEstado && item.estadoACurar != widget.batalla.jugador.estadoActual;

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDisabled ? Colors.grey[400] : Colors.amber[700],
                  foregroundColor: Colors.black,
                  disabledForegroundColor: Colors.black54,
                  disabledBackgroundColor: Colors.grey[300],
                  textStyle: const TextStyle(fontSize: 14),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
                onPressed: widget.batalla.enCurso && !isDisabled
                    ? () => usarItem(item) 
                    : null,
                child: Text(item.nombreItem, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }


  Color _getColorPorTipo(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'fire': return Colors.red;
      case 'water': return Colors.blue;
      case 'grass': return Colors.green;
      case 'bug': return Colors.lightGreen;
      case 'poison': return Colors.purpleAccent;
      case 'ground': return Colors.brown[400]!;
      case 'flying': return Colors.lightBlueAccent;
      case 'dragon': return Colors.indigoAccent;
      case 'steel': return const Color.fromARGB(255, 236, 198, 198);
      case 'electric': return Colors.yellow[700]!;
      case 'rock': return Colors.brown;
      case 'psychic': return Colors.purple;
      case 'ghost': return Colors.indigo;
      case 'ice': return Colors.cyan;
      case 'fight': return Colors.orange[900]!; 
      case 'dark': return const Color.fromARGB(137, 102, 65, 65);
      default: return Colors.grey;
    }
  }

  Color _getColorPorEstado(EstadoCondicion estado) {
    switch (estado) {
      case EstadoCondicion.quemado: return Colors.red;
      case EstadoCondicion.envenenado: return Colors.purple;
      case EstadoCondicion.congelado: return Colors.cyan;
      case EstadoCondicion.paralizado: return Colors.yellow[700]!;
      default: return Colors.grey;
    }
  }



  @override
  Widget build(BuildContext context) {
    var jugador = widget.batalla.jugador;
    var rival = widget.batalla.rival;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Batalla Pokémon",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        
      ),
      body: Column(
        children: [
          
          Expanded(
            flex: 5, 
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(color: Colors.black), 
                ),
                // RIVAL
                Positioned(
                  top: 20,
                  right: 20,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: barraDeVida(rival, const Color.fromARGB(255, 243, 169, 164)),
                      ),
                      const SizedBox(width: 10),
                      construirImagenPokemon(rival.nombre, true),
                    ],
                  ),
                ),
                // JUGADOR
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: [
                      construirImagenPokemon(jugador.nombre, false),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: barraDeVida(jugador, const Color.fromARGB(255, 160, 218, 162)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.symmetric(horizontal: BorderSide(color: Colors.grey[800]!, width: 2)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  mensajeLog,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Courier'),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => setState(() => _menuActual = MenuBatalla.Ataque),
                            icon: const Icon(Icons.flash_on),
                            label: const Text("Ataque", style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _menuActual == MenuBatalla.Ataque ? Colors.cyanAccent : Colors.grey[900],
                              foregroundColor: _menuActual == MenuBatalla.Ataque ? Colors.black : Colors.white70,
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              side: _menuActual == MenuBatalla.Ataque 
                                  ? BorderSide(color: Colors.cyanAccent.shade700, width: 2) 
                                  : BorderSide.none,
                                  shadowColor: _menuActual == MenuBatalla.Ataque ? Colors.cyanAccent : null,
                                  elevation: _menuActual == MenuBatalla.Ataque ? 8 : 2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => setState(() => _menuActual = MenuBatalla.Item)
                            ,
                            icon: const Icon(Icons.shopping_bag),
                            label: Text("Item (${widget.batalla.itemsUsuario.length})", style: const TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _menuActual == MenuBatalla.Item ? Colors.pinkAccent : Colors.grey[900],
                              foregroundColor: _menuActual == MenuBatalla.Item ? Colors.black : Colors.white70,
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              side: _menuActual == MenuBatalla.Item
                              ? const BorderSide(color: Colors.pink, width: 2) 
                              : BorderSide.none,

                              shadowColor: _menuActual == MenuBatalla.Item 
                              ? Colors.pinkAccent.withOpacity(  0.9):null,
                              elevation: _menuActual == MenuBatalla.Item ? 15 : 2,     
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _menuActual == MenuBatalla.Ataque
                          ? _buildMenuAtaques(jugador)
                          : _buildMenuItems(widget.batalla.itemsUsuario),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}