import 'package:flutter/material.dart';
import 'dart:math'; 
import 'package:audioplayers/audioplayers.dart';

import '../logic/Instancias.dart'; 
import '../logic/Base.dart'; 
import '../logic/SistemaBatalla.dart';
import 'BattleScreen.dart'; 

class ItemSelectionScreen extends StatefulWidget {
  final PokemonBatalla jugadorSeleccionado;
  final PokemonBatalla rivalSeleccionado;

  const ItemSelectionScreen({
    super.key,
    required this.jugadorSeleccionado,
    required this.rivalSeleccionado,
  });

  @override
  State<ItemSelectionScreen> createState() => _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  static const int maxItems = 3; 

  final AudioPlayer _audioPlayer = AudioPlayer();
  

  List<Item> itemsSeleccionados = [];
  
  final List<Item> itemsDisponibles = [
    pocion, 
    superPocion, 
    hiperPocion, 
    antidoto, 
    antiquemar, 
    despertar, 
    antiparalisis
  ];

  late final List<Item> itemsRivalBase; 
  

  void _iniciarMusica(String assetPath) async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource(assetPath));
  }

  
  @override
  void initState() {
    super.initState();
    itemsRivalBase = _getRandomRivalItems(); 

    _iniciarMusica('music/musica_items.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.stop(); 
    _audioPlayer.dispose();
    super.dispose();
  }

  List<Item> _getRandomRivalItems() {
    final List<Item> pool = List.from(itemsDisponibles); 
    final List<Item> selected = [];
    final Random rand = Random();

    final int count = rand.nextInt(maxItems) + 1; 

    for (int i = 0; i < count; i++) {
      if (pool.isEmpty) break;
      
      final int randomIndex = rand.nextInt(pool.length);
      final Item item = pool.removeAt(randomIndex); 
      selected.add(item);
    }
    
    return selected;
  }
  
  void seleccionarItem(Item item) {
    setState(() {
      if (itemsSeleccionados.contains(item)) {
        itemsSeleccionados.remove(item);
      } else if (itemsSeleccionados.length < maxItems) {
        itemsSeleccionados.add(item);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Solo puedes seleccionar un máximo de 3 items."),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

  void irALaBatalla() {
    widget.jugadorSeleccionado.vida = widget.jugadorSeleccionado.vidaMax;
    widget.rivalSeleccionado.vida = widget.rivalSeleccionado.vidaMax;
    widget.jugadorSeleccionado.estadoActual = EstadoCondicion.normal;
    widget.rivalSeleccionado.estadoActual = EstadoCondicion.normal;


    Batalla batalla = Batalla(
      jugador: widget.jugadorSeleccionado,
      rival: widget.rivalSeleccionado,
      itemsUsuario: itemsSeleccionados, 
      itemsRivalBase: itemsRivalBase, 
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BattleScreen(batalla: batalla)),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    final rivalItemsText = itemsRivalBase.map((item) => item.nombreItem).join(', ');
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Selección de Items",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[900],
        child: Column(
          children: [
            Text(
              "Elige tus Items de Combate",
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Items seleccionados: ${itemsSeleccionados.length} / $maxItems",
              style: TextStyle(
                color: itemsSeleccionados.length == maxItems ? Colors.greenAccent : Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 6.0),
              child: Text(
                "Rival asignado (${itemsRivalBase.length} items): $rivalItemsText",
                style: const TextStyle(color: Colors.white54, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(color: Colors.white12, thickness: 1, height: 20),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),//
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, 
                  crossAxisSpacing: 6,//
                  mainAxisSpacing: 6,//es
                  childAspectRatio: 1.8,
                ),
                itemCount: itemsDisponibles.length,
                itemBuilder: (context, index) {
                  final item = itemsDisponibles[index];
                  final isSelected = itemsSeleccionados.contains(item);
                  
                  return _buildItemGridItem(item, isSelected);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: itemsSeleccionados.isNotEmpty ? Colors.redAccent : Colors.grey, 
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal:40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                  ),
                  onPressed: itemsSeleccionados.isNotEmpty ? irALaBatalla : null, 
                  icon: const Icon(Icons.flash_on, size: 28),
                  label: const Text(
                    "¡LISTO! IR A LA BATALLA",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemGridItem(Item item, bool isSelected) {
    return GestureDetector(
      onTap: () => seleccionarItem(item),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[900] : Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent, 
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( 
              child: Image.asset(
                item.imagenPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.broken_image, size: 30, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item.nombreItem,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              item.descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}