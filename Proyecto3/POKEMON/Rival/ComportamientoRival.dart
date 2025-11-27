import 'dart:math';

import 'Base.dart';
import 'Instancias.dart';
import 'SistemaBatalla2.dart';

class ComportamientoRival {
  final Random _rand = Random();

  //lógica de decision
  String tomarDecision(PokemonBatalla rival, List<Item> itemsDisponibles) {
    //1.PRIORIDAD MÁXIMA:curar estado anormal 
    if (rival.estadoActual != EstadoCondicion.normal) {
      Item? itemGenerico = itemsDisponibles.firstWhere(
        (item) =>
            item is CuraEstado &&
            item.cantidad > 0 &&
            (item as CuraEstado).curaQue.contains(rival.estadoActual),
        orElse: () => null, 
      );

      if (itemGenerico is CuraEstado && itemGenerico.cantidad > 0) {
        return "USAR_ITEM_ESTADO";
      }
    }

    //2.SEGUNDA PRIORIDAD: curar vida (si está a la mitad o menos)
    if (rival.vida <= rival.vidaMax / 2) {
      Item? itemGenerico = itemsDisponibles.firstWhere(
        (item) => item is Pocion && item.cantidad > 0,
        orElse: () => null,
      );

      if (itemGenerico is Pocion && itemGenerico.cantidad > 0) {
        return "USAR_ITEM_POCION";
      }
    }

    //3.PREDETERMINADO: Atacar
    return "ATACAR";
  }

  // Método auxiliar para seleccionar un ataque (necesario para la Batalla.dart)
  Ataque elegirAtaqueAleatorio(PokemonBatalla rival) {
    if (rival.misAtaques.isEmpty) {
      //si no hay ataques disponibles
      throw Exception("El Pokémon rival no tiene ataques definidos.");
    }
    int indice = _rand.nextInt(rival.misAtaques.length);
    return rival.misAtaques[indice];
  }
}
