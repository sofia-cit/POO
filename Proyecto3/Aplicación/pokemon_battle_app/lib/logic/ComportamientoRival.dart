import 'dart:math';
import 'Base.dart';

class ComportamientoRival {
  final Random _rand = Random();

  String tomarDecision(PokemonBatalla rival, List<Item> itemsDisponibles) {
    // 1. PRIORIDAD MÁXIMA: curar estado anormal 
    if (rival.estadoActual != EstadoCondicion.normal) {
      try {
        // Solo verificar si existe el item, sin guardar la variable
        itemsDisponibles.firstWhere(
          (item) => item is CuradorEstado && 
                    item.cantidad > 0 &&
                    item.estadoACurar == rival.estadoActual
        );
        //se encontró el item
        return "USAR_ITEM_ESTADO";
      } catch (e) {
        //no se encontró item, continuar con siguiente prioridad
      }
    }

    //curar vida (si está a la mitad o menos)
    if (rival.vida <= rival.vidaMax / 2) {
      try {
        itemsDisponibles.firstWhere(
          (item) => item is Pocion && item.cantidad > 0
        );
        return "USAR_ITEM_POCION";
      } catch (e) {
        //no se encontró poción, continuar
      }
    }

    //Atacar si ninguna de las condiciones anteriores se cumple
    return "ATACAR";
  }

  Ataque elegirAtaqueAleatorio(PokemonBatalla rival) {
    if (rival.misAtaques.isEmpty) {
      throw Exception("El Pokémon rival no tiene ataques definidos.");
    }
    int indice = _rand.nextInt(rival.misAtaques.length);
    return rival.misAtaques[indice];
  }
}