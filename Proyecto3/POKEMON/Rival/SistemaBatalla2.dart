//MODIFICACIONES EN LA PARTE DE ROMAN
import 'dart:io';
import 'dart:math';

import '../Base.dart';
import '../Instancias.dart';
import 'ComportamientoRival.dart'; 

abstract class AccionTurno {}
class AccionAtacar extends AccionTurno {
  final Ataque movimiento;
  AccionAtacar(this.movimiento);
}

class AccionUsarItem extends AccionTurno {
  final Item item;
  final PokemonBatalla objetivo;
  AccionUsarItem(this.item, this.objetivo);
}

class Batalla {
  //cambios en los atributos y la eleccion
  final List<PokemonBatalla> _pokedexGeneral; 
  final ComportamientoRival _iaRival = ComportamientoRival(); 
  
  //estos se inicializan después de la selección
  late PokemonBatalla _jugador;
  late PokemonBatalla _rival;
  
  List<Item> itemsUsuario;      //mochila del usuario
  List<Item> _itemsRivalActuales; //mochila del rival
  bool _enCurso = true;

  //ahora recibe la lista general de Pokémon y los items 
  Batalla(this._pokedexGeneral, this.itemsUsuario, List<Item> itemsRivalBase) {
      _itemsRivalActuales = List<Item>.from(itemsRivalBase.map((item) {
          if (item is Pocion) return Pocion(item.nombreItem, item.cantidad, item.recuperacion);
          if (item is CuraEstado) return CuraEstado(item.nombreItem, item.cantidad, item.descripcion, item.curaQue);
          return item;
      }));

      if (_pokedexGeneral.isEmpty) {
        throw Exception("Error de Inicialización: La Pokedex no debe estar vacía.");
      }
  }
  bool get enCurso => _enCurso && _jugador.vida > 0 && _rival.vida > 0;


  //AÑADIDO:método para que el usuario elija su Pokémon
  void _seleccionarPersonaje() {
    print("\n--- SELECCIÓN DE PERSONAJE ---");
    for (int i = 0; i < _pokedexGeneral.length; i++) {
        print("${i + 1}. ${_pokedexGeneral[i].nombre} (Tipo: ${_pokedexGeneral[i].tipo}, HP: ${_pokedexGeneral[i].vidaMax.toStringAsFixed(0)}, VEL: ${_pokedexGeneral[i].velocidad})");
    }

    int eleccion = -1;
    while (eleccion < 1 || eleccion > _pokedexGeneral.length) {
      stdout.write("Elige tu Pokémon (1-${_pokedexGeneral.length}): ");
      String? input = stdin.readLineSync(); 
      try {
        eleccion = int.tryParse(input ?? "") ?? -1;
      } catch (e) { eleccion = -1; }
    }
    _jugador = _pokedexGeneral[eleccion - 1]; 
    print("¡Has elegido a: ${_jugador.nombre}!");
  }


  //AÑADIDO:método para que el usuario elija el rival 
  void _seleccionarRival() {
    print("\n--- SELECCIÓN DE RIVAL ---");
    //para que el rival no sea el mismo que el jugador
    List<PokemonBatalla> rivalesDisponibles = _pokedexGeneral.where((p) => p.nombre != _jugador.nombre).toList();
    
    for (int i = 0; i < rivalesDisponibles.length; i++) {
        print("${i + 1}. ${rivalesDisponibles[i].nombre} (Tipo: ${rivalesDisponibles[i].tipo}, HP: ${rivalesDisponibles[i].vidaMax.toStringAsFixed(0)}, VEL: ${rivalesDisponibles[i].velocidad})");
    }

    int eleccion = -1;
    while (eleccion < 1 || eleccion > rivalesDisponibles.length) {
      stdout.write("Elige el Pokémon RIVAL (1-${rivalesDisponibles.length}): ");
      String? input = stdin.readLineSync(); 
      try {
        eleccion = int.tryParse(input ?? "") ?? -1;
      } catch (e) { eleccion = -1; }
    }
    
    _rival = rivalesDisponibles[eleccion - 1];
    print("¡Tu rival ha elegido a: ${_rival.nombre}!");
  }

  AccionTurno _convertirDecisionRival(String decision) {
    if (decision == "ATACAR") {
      return AccionAtacar(_iaRival.elegirAtaqueAleatorio(_rival));
    } 
    else if (decision == "USAR_ITEM_POCION") {
      Item? itemBuscado = _itemsRivalActuales.firstWhere(
        (item) => item is Pocion && item.cantidad > 0,
        orElse: () => null,
      );
      if (itemBuscado is Pocion) {
        return AccionUsarItem(itemBuscado, _rival);
      }
    }
    else if (decision == "USAR_ITEM_ESTADO") {
      Item? itemBuscado = _itemsRivalActuales.firstWhere(
        (item) => item is CuraEstado && item.cantidad > 0 && 
                  (item as CuraEstado).curaQue.contains(_rival.estadoActual),
        orElse: () => null,
      );
      if (itemBuscado is CuraEstado) {
        return AccionUsarItem(itemBuscado, _rival);
      }
    }
    return AccionAtacar(_rival.misAtaques[0]);
  }

  void _ejecutarAccion(PokemonBatalla atacante, AccionTurno accion) {
    if (accion is AccionAtacar) {
      PokemonBatalla objetivo = (atacante == _jugador) ? _rival : _jugador;
      atacante.atacar(objetivo, accion.movimiento);
    } else if (accion is AccionUsarItem) {
      accion.item.usar(accion.objetivo);
    }
  }


  //determina el orden de acción y las ejecuta (referencias actualizadas)
  void determinarTurno(AccionTurno accionUsuario, AccionTurno accionRival) {
      PokemonBatalla primero = _jugador.velocidad >= _rival.velocidad ? _jugador : _rival;
      PokemonBatalla segundo = _jugador.velocidad >= _rival.velocidad ? _rival : _jugador;
      AccionTurno accionPrimero = (primero == _jugador) ? accionUsuario : accionRival;
      AccionTurno accionSegundo = (segundo == _jugador) ? accionUsuario : accionRival;
      
      print("\n--- INICIO TURNO (Primero: ${primero.nombre}, Segundo: ${segundo.nombre}) ---");

      print("-> Acción de ${primero.nombre}:");
      _ejecutarAccion(primero, accionPrimero);
      
      if (_jugador.vida <= 0 || _rival.vida <= 0) { finBatalla(); return; }

      if (segundo.vida > 0) {
        print("\n-> Acción de ${segundo.nombre}:");
        _ejecutarAccion(segundo, accionSegundo);
      }

      //daño Residual (usa _jugador y _rival)
      print("\n--- Fase de Daño Residual ---\n");
      if (_jugador.vida > 0) _jugador.finDeTurno(); 
      if (_rival.vida > 0) _rival.finDeTurno();

      finBatalla();
  }
  
  void finBatalla() {
    if (_jugador.vida <= 0 || _rival.vida <= 0) {
      _enCurso = false;
      print("\n--- ¡BATALLA TERMINADA! ---");
      if (_jugador.vida > 0) {
        print("¡VICTORIA! Ganó ${_jugador.nombre}.");
      } else {
        print("DERROTA. Ganó ${_rival.nombre}.");
      }
    }
  }

  //BUCLE PRINCIPAL (para que lo llame Cit)
  void iniciarBatallaLucha() {
    //1.Fase de Selección
    _seleccionarPersonaje();
    _seleccionarRival();

    print("\n--- ¡BATALLA LISTA! COMIENZA EL COMBATE ---");

    while (enCurso) {
      
      //2.Turno del Jugador (simulación de la parte5)
      print("\n=======================================================");
      print("TURNO DE ${_jugador.nombre} (HP: ${_jugador.vida.toStringAsFixed(0)}/${_jugador.vidaMax.toStringAsFixed(0)}, Estado: ${_jugador.estadoActual})");
      print("RIVAL: ${_rival.nombre} (HP: ${_rival.vida.toStringAsFixed(0)}/${_rival.vidaMax.toStringAsFixed(0)}, Estado: ${_rival.estadoActual})");
      print("=======================================================");

      //SIMULACIÓN DE INPUT DEL JUGADOR (Cit reemplaza esto por un menú real)
      stdout.write("Elige una acción (1. Atacar con ${_jugador.misAtaques[0].nombreAtaque}): ");
      stdin.readLineSync(); 
      AccionTurno accionUsuario = AccionAtacar(_jugador.misAtaques[0]);
      
      //3.Turno del Rival
      String decisionRivalStr = _iaRival.tomarDecision(_rival, _itemsRivalActuales);
      AccionTurno accionRival = _convertirDecisionRival(decisionRivalStr);
      
      //4.Ejecutar el Turno
      determinarTurno(accionUsuario, accionRival);

      //Pausa
      if (enCurso) {
        stdout.write("\nPresiona ENTER para continuar...");
        stdin.readLineSync(); 
      }
    }
  }
}