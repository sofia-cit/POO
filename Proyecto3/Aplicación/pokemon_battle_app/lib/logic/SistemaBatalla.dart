import 'dart:math';
import 'Base.dart';
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
  final Random _rand = Random();
  final ComportamientoRival _iaRival = ComportamientoRival();

  PokemonBatalla jugador;
  PokemonBatalla rival;
  List<Item> itemsUsuario;
  List<Item> itemsRivalActuales;
  
  bool enCurso = true;
  
  List<String> logTurno = [];

  Batalla({
    required this.jugador,
    required this.rival,
    required this.itemsUsuario,
    required List<Item> itemsRivalBase,
  }) : itemsRivalActuales = List<Item>.from(itemsRivalBase);

  List<String> ejecutarTurnoJugador(Ataque ataqueSeleccionado) {
    logTurno.clear(); 

    if (!enCurso) {
      logTurno.add("La batalla ha terminado.");
      return logTurno;
    }

    AccionTurno accionUsuario = AccionAtacar(ataqueSeleccionado);
    
    String decisionRivalStr = _iaRival.tomarDecision(rival, itemsRivalActuales);
    AccionTurno accionRival = _convertirDecisionRival(decisionRivalStr);

    _determinarYEjecutar(accionUsuario, accionRival);

    return logTurno; 
  }

  void _determinarYEjecutar(AccionTurno accionUsuario, AccionTurno accionRival) {
    double velocidadUsuario = jugador.velocidad.toDouble();
    double velocidadRival = rival.velocidad.toDouble();

    if (jugador.estadoActual == EstadoCondicion.paralizado) velocidadUsuario /= 2;
    if (rival.estadoActual == EstadoCondicion.paralizado) velocidadRival /= 2;

    PokemonBatalla primero, segundo;
    AccionTurno accionPrimero, accionSegundo;

    // Determinar orden
    if (velocidadUsuario > velocidadRival) {
      primero = jugador;
      segundo = rival;
      accionPrimero = accionUsuario;
      accionSegundo = accionRival;
    } else if (velocidadRival > velocidadUsuario) {
      primero = rival;
      segundo = jugador;
      accionPrimero = accionRival;
      accionSegundo = accionUsuario;
    } else {
      if (_rand.nextBool()) {
        primero = jugador;
        segundo = rival;
        accionPrimero = accionUsuario;
        accionSegundo = accionRival;
      } else {
        primero = rival;
        segundo = jugador;
        accionPrimero = accionRival;
        accionSegundo = accionUsuario;
      }
    }

    logTurno.add("--- INICIO TURNO ---");

    logTurno.add("-> Turno de ${primero.nombre}:");
    _ejecutarAccionIndividual(primero, segundo, accionPrimero);

    if (_verificarFinBatalla()) return;

    if (segundo.vida > 0) {
      logTurno.add("\n-> Turno de ${segundo.nombre}:");
      _ejecutarAccionIndividual(segundo, primero, accionSegundo);
    }

    if (_verificarFinBatalla()) return;

    _aplicarEfectosFinDeTurno();
    
    _verificarFinBatalla();
  }



void _ejecutarAccionIndividual(PokemonBatalla atacante, PokemonBatalla defensor, AccionTurno accion) {
    if (accion is AccionAtacar) {
      atacante.atacar(defensor, accion.movimiento);
      logTurno.add("${atacante.nombre} usó ${accion.movimiento.nombreAtaque}.");
    } else if (accion is AccionUsarItem) {
      accion.item.usar(accion.objetivo);
      accion.item.cantidad--;
      logTurno.add(
        "${atacante.nombre} usó ${accion.item.nombreItem}"
      );
      if (accion.item.cantidad <= 0) {
          if (atacante == jugador) {
              itemsUsuario.remove(accion.item);
          } else if (atacante == rival) {
              itemsRivalActuales.remove(accion.item);
          }
      }
    }
}
  

  AccionTurno _convertirDecisionRival(String decision) {
    if (decision == "ATACAR") {
      return AccionAtacar(_iaRival.elegirAtaqueAleatorio(rival));
    } else if (decision == "USAR_ITEM_POCION") {
      var item = itemsRivalActuales.firstWhere((i) => i is Pocion && i.cantidad > 0);
      return AccionUsarItem(item, rival);
    } else if (decision == "USAR_ITEM_ESTADO") {
      var item = itemsRivalActuales.firstWhere(
        (i) => i is CuradorEstado && i.cantidad > 0 && i.estadoACurar == rival.estadoActual
      );
      return AccionUsarItem(item, rival);
    }

    return AccionAtacar(rival.misAtaques[0]);
  }

  void _aplicarEfectosFinDeTurno() {
    if (jugador.vida > 0) jugador.finDeTurno();
    if (rival.vida > 0) rival.finDeTurno();
  }

  bool _verificarFinBatalla() {
    if (jugador.vida <= 0) {
      enCurso = false;
      logTurno.add("\n¡${jugador.nombre} se debilitó!");
      logTurno.add("¡PERDISTE! ${rival.nombre} gana.");
      return true;
    } else if (rival.vida <= 0) {
      enCurso = false;
      logTurno.add("\n¡${rival.nombre} se debilitó!");
      logTurno.add("¡VICTORIA! Has ganado la batalla.");
      return true;
    }
    return false;
  }

  List<String> ejecutarTurnoJugadorItem(Item itemSeleccionado, PokemonBatalla objetivo) {
  logTurno.clear();

  if (!enCurso) {
    logTurno.add("La batalla ha terminado.");
    return logTurno;
  }

  AccionTurno accionUsuario = AccionUsarItem(itemSeleccionado, objetivo);
  
  String decisionRivalStr = _iaRival.tomarDecision(rival, itemsRivalActuales);
  AccionTurno accionRival = _convertirDecisionRival(decisionRivalStr);


  _determinarYEjecutar(accionUsuario, accionRival);

  return logTurno; 
}
}

