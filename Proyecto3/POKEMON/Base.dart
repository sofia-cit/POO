import 'dart:math';
//Mario

abstract class Combate {
  void atacar(Pokemon objetivo, Ataque movimiento);
  void mostrarAtaque();
}

//clase base pokemon
abstract class Pokemon implements Combate {
  String tipo;
  String nombre;
  double vida;
  double vidaMax;
  int nivel;

  Pokemon(this.tipo, this.nombre, num vidaInput, this.nivel)
      : vida = vidaInput.toDouble(),
        vidaMax = vidaInput.toDouble();

  void recibirDanio(int cantidad) {
    vida -= cantidad;
    if (vida < 0) vida = 0;
  }

  @override
  void mostrarAtaque() {
    print("$nombre se prepara para la acción.");
  }
}

// clase ataque
class Ataque {
  String tipoAtaque;
  String nombreAtaque;
  int danio;
  double efectivo = 1.0;

  Ataque(this.tipoAtaque, this.nombreAtaque, this.danio);

  int calcularDanio() => (efectivo * danio).toInt();
}

// clase efectividad
class Efectividad {
  double calcularEfectividad(String tipoAtaque, String tipoEnemigo) {
    double factor = 1.0;

    //Tabla de efectividad (Mapa)

    return factor;
  }
}

//estados de condicion
enum EstadoCondicion {
  normal,
  quemado,
  envenenado,
  congelado,
  paralizado,
}

// clase pokemon de batalla
class PokemonBatalla extends Pokemon {
  EstadoCondicion estadoActual = EstadoCondicion.normal;
  List<Ataque> misAtaques;

  PokemonBatalla(String tipo, String nombre, num vidaInput, int nivel, this.misAtaques)
      : super(tipo, nombre, vidaInput, nivel);

  @override
  void atacar(Pokemon objetivo, Ataque movimiento) {
    if (estadoActual == EstadoCondicion.congelado) {
      print("¡$nombre está CONGELADO y no puede moverse!");
      return;
    }

    if (estadoActual == EstadoCondicion.paralizado) {
      if (Random().nextInt(5) == 0) {
        print("¡$nombre está PARALIZADO y no puede atacar!");
        return;
      }
    }

    Efectividad calc = Efectividad();
    movimiento.efectivo = calc.calcularEfectividad(movimiento.tipoAtaque, objetivo.tipo);

    int danioFinal = movimiento.calcularDanio();
    objetivo.recibirDanio(danioFinal);

    print("\n$nombre usó ${movimiento.nombreAtaque}!");
    if (movimiento.efectivo > 1) print("¡Es muy eficaz! (x${movimiento.efectivo})");
    if (movimiento.efectivo < 1) print("No es muy eficaz... (x${movimiento.efectivo})");

    print("Daño hecho: $danioFinal");
    print("Vida de ${objetivo.nombre}: ${objetivo.vida}/${objetivo.vidaMax}");
  }

  void finDeTurno() {
    if (estadoActual == EstadoCondicion.quemado) {
      int d = (vidaMax * 0.06).toInt();
      recibirDanio(d);
      print("$nombre recibe daño por quemadura (-$d HP).");
    }
    if (estadoActual == EstadoCondicion.envenenado) {
      int d = (vidaMax * 0.12).toInt();
      recibirDanio(d);
      print("$nombre recibe daño por veneno (-$d HP).");
    }
  }
}

//clase item
abstract class Item {
  String nombreItem;
  String tipoItem;
  int cantidad;
  String descripcion;

  Item(this.nombreItem, this.tipoItem, this.cantidad, this.descripcion);

  void usar(Pokemon objetivo);
}
