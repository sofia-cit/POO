import 'dart:math';
import 'Base.dart';
import 'Instancias.dart';

abstract class AccionTurno {}


class AccionAtacar extends AccionTurno {
  final Ataque movimiento;
  AccionAtacar(this.movimiento);
}

//necesitamos el item y el objetivo
class AccionUsarItem extends AccionTurno {
  final Item item;
  final PokemonBatalla objetivo;
  AccionUsarItem(this.item, this.objetivo);
}

// clase principal de la batalla

class Batalla {
  final PokemonBatalla pokemonUsuario;
  final PokemonBatalla pokemonRival; 
  List<Item> itemsUsuario; // mochila del usuario
  List<Item> itemsRival;   // mochila del rival 
  bool _enCurso = true;

  // manejo de excepciones
  Batalla(this.pokemonUsuario, this.pokemonRival, this.itemsUsuario, this.itemsRival) {
    if (pokemonUsuario.vida <= 0 || pokemonRival.vida <= 0) {
      throw Exception("Error de Inicialización: Ambos Pokémon deben iniciar con vida > 0.");
    }
  }

  //verifica si la batalla ha terminado
  bool get enCurso => _enCurso && pokemonUsuario.vida > 0 && pokemonRival.vida > 0;

  // iniciar el ciclo de batalla (para que lo llame la UI de Citlali).
  void iniciarBatalla() {
    print("--- ¡INICIO DE BATALLA! ---");
    print("Jugador: ${pokemonUsuario.nombre} (${pokemonUsuario.vidaMax} HP, ${pokemonUsuario.velocidad} VEL)");
    print("Rival:   ${pokemonRival.nombre} (${pokemonRival.vidaMax} HP, ${pokemonRival.velocidad} VEL)\n");

  }

  //determinar el orden de acción basado en la velocidad
  (PokemonBatalla atacante, PokemonBatalla defensor) determinarTurno() {
    double velocidadUsuario = pokemonUsuario.velocidad.toDouble();
    if (pokemonUsuario.estadoActual == EstadoCondicion.paralizado) {
      velocidadUsuario /= 2;
    }
    double velocidadRival = pokemonRival.velocidad.toDouble();
    if (pokemonRival.estadoActual == EstadoCondicion.paralizado) {
      velocidadRival /= 2;
    }
    if (velocidadUsuario > velocidadRival) {
      return (pokemonUsuario, pokemonRival);
    } else if (velocidadRival > velocidadUsuario) {
      return (pokemonRival, pokemonUsuario);
    } else {
      // si las velocidades son iguales el orden es aleatorio
      return Random().nextBool() ? (pokemonUsuario, pokemonRival) : (pokemonRival, pokemonUsuario);
    }
  }

  void _ejecutarAccion(PokemonBatalla actor, AccionTurno accion) {
    if (actor.vida <= 0) return; // si el Pokémon ya se debilitó, no puede actuar

    if (accion is AccionAtacar) {
      PokemonBatalla objetivo = (actor == pokemonUsuario) ? pokemonRival : pokemonUsuario;
      actor.atacar(objetivo, accion.movimiento);
    } 
    else if (accion is AccionUsarItem) {
      accion.item.usar(accion.objetivo); 
    }
  }

  void ejecutarTurno(AccionTurno accionUsuario, AccionTurno accionRival) {
    if (!enCurso) {
      print("La batalla ha terminado. No se pueden ejecutar más turnos.");
      return;
    }

    // determinar quién ataca primero
    final (primero, segundo) = determinarTurno();

    // asignar las acciones al orden de turno
    AccionTurno accionPrimero = (primero == pokemonUsuario) ? accionUsuario : accionRival;
    AccionTurno accionSegundo = (segundo == pokemonUsuario) ? accionUsuario : accionRival;

    print("\n--- INICIO TURNO (Primero: ${primero.nombre}, Segundo: ${segundo.nombre}) ---");

    //ejecutar la acción del primero
    print("-> Acción de ${primero.nombre}:");
    _ejecutarAccion(primero, accionPrimero);
    
    //comprobar si la batalla terminó después del primer ataque
    if (primero.vida <= 0 || segundo.vida <= 0) {
      finBatalla();
      return;
    }

    // ejecutar la acción del segundo, solo si aun puede
    if (segundo.vida > 0) {
      print("\n-> Acción de ${segundo.nombre}:");
      _ejecutarAccion(segundo, accionSegundo);
    }

    // aplicar daño de estados (quemado/envenenado)
    print("\n--- Fase de Daño Residual ---");
    if (pokemonUsuario.vida > 0) pokemonUsuario.finDeTurno(); 
    if (pokemonRival.vida > 0) pokemonRival.finDeTurno();

    // comprobar el fin de batalla al final del turno
    finBatalla();
  }
  // comprobar y anunciar el fin de la batalla.
  void finBatalla() {
    if (pokemonUsuario.vida <= 0) {
      _enCurso = false;
      print("\n--- ¡BATALLA TERMINADA! ---");
      print("${pokemonUsuario.nombre} se debilitó.");
      print("¡${pokemonRival.nombre} (Rival) ha ganado la batalla!");
    } else if (pokemonRival.vida <= 0) {
      _enCurso = false;
      print("\n--- ¡BATALLA TERMINADA! ---");
      print("${pokemonRival.nombre} se debilitó.");
      print("¡${pokemonUsuario.nombre} (Jugador) ha ganado la batalla!");
    }
    // si ambos tienen vida, la batalla sigue
  }
}
