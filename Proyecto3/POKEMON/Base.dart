import 'dart:math';
// Mario

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
  int velocidad; // CORRECCIÓN, no estaba esta parte para determinar el turno

  // CORRECCIÓN, actualizo el constructor para recibir velocidad
  Pokemon(this.tipo, this.nombre, num vidaInput, this.nivel, this.velocidad)
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

    const Map<String, Map<String, double>> efectividad = {
  // Ataque | Defensa: {
  'Normal': {
    'Fight':2.0,
    'Ghost':0.0,
  },
  'Fire': {
    'Fire':0.5,
    'Grass':0.5,
    'Water':2.0,
    'Rock':2.0,
    'Bug':0.5,
    'Ice':0.5,
    'Steel':0.5,
    'Ground':2.0,
  },
  'Water': {
    'Fire':0.5,
    'Water':0.5,
    'Grass':2.0,
    'Ice':0.5,
    'Steel':0.5,
    'Electric':2.0
  },
  'Electric': {
    'Electric':0.5,
    'Ground':2.0,
    'Flying':0.5,
    'Steel':0.5,
  },
  'Grass': {
    'Fire':2.0,
    'Water':0.5,
    'Electric':0.5,
    'Grass':0.5,
    'Ice':2.0,
    'Poison':2.0,
    'Ground':0.5,
    'Flying':2.0,
    'Bug':2.0,
  },
  'Ice': {
    'Fire':2.0,
    'Ice':0.5,
    'Fight':2.0,
    'Rock':2.0,
    'Steel':2.0,
  },
  'Fight': {
    'Flying':2.0,
    'Psycho':2.0,
    'Bug':0.5,
    'Rock':0.5,
    'Dark':0.5,
  },
  'Poison': {
    'Grass':0.5,
    'Fight':0.5,
    'Poison':0.5,
    'Ground':2.0,
    'Psycho':2.0,
    'Bug':0.5,
  },
  'Ground': {
    'Water':2.0,
    'Electric':0.0,
    'Grass':2.0,
    'Ice':2.0,
    'Poison':0.5,
    'Rock':0.5,
  },
  'Flying': {
    'Electric':2.0,
    'Grass':0.5,
    'Ice':2.0,
    'Fight':0.5,
    'Ground':0.0,
    'Bug':0.5,
    'Rock':2.0,
  },
  'Psycho': {
    'Fight':0.5,
    'Psycho':0.5,
    'Bug':2.0,
    'Ghost':2.0,
    'Dark':2.0,
  },
  'Bug': {
    'Fire':2.0,
    'Grass':0.5,
    'Fight':0.5,
    'Ground':0.5,
    'Flying':2.0,
    'Rock':2.0,
  },
  'Rock': {
    'Normal':0.5,
    'Fire':0.5,
    'Water':2.0,
    'Grass':2.0,
    'Fight':2.0,
    'Poison':0.5,
    'Ground':2.0,
    'Flying':0.5,
    'Steel':2.0,
  },
  'Ghost': {
    'Normal':0.0,
    'Fight':0.0,
    'Poison':0.5,
    'Bug':0.5,
    'Ghost':2.0,
    'Dark':2.0,
  },
  'Dragon': {
    'Fire':0.5,
    'Water':0.5,
    'Electric':0.5,
    'Grass':0.5,
    'Ice':2.0,
    'Dragon':2.0,
  },
  'Dark': {
    'Fight':2.0,
    'Psycho':0.0,
    'Bug':2.0,
    'Ghost':0.5,
    'Dark':0.5,
  },
  'Steel': {
    'Normal':0.5,
    'Fire':2.0,
    'Grass':0.5,
    'Ice':0.5,
    'Fight':2.0,
    'Poison':0.0,
    'Ground':2.0,
    'Flying':0.5,
    'Psycho':0.5,
    'Bug':0.5,
    'Rock':0.5,
    'Ghost':0.5,
    'Dragon':0.5,
    'Dark':0.5,
    'Steel':0.5,
  },

    
};

    if (efectividad.containsKey(tipoAtaque)) {
      final ataques = efectividad[tipoAtaque]!;
      if (ataques.containsKey(tipoEnemigo)) {
        factor = ataques[tipoEnemigo]!;
      }
    }

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

  // agrego también velocidad al constructor y a la llamada a super
  PokemonBatalla(String tipo, String nombre, num vidaInput, int nivel,int velocidad, this.misAtaques)
      : super(tipo, nombre, vidaInput, nivel, velocidad);

  @override
  void atacar(Pokemon objetivo, Ataque movimiento) {
    if (estadoActual == EstadoCondicion.congelado) {
      print("¡$nombre está CONGELADO y no puede moverse!");
      return;
    }

    if (estadoActual == EstadoCondicion.paralizado) {
      if (Random().nextInt(5) == 0) {//20% de probabilidad de no atacar
        print("¡$nombre está PARALIZADO y no puede atacar!");
        return;
      }
    }
     Efectividad calc = Efectividad();
    movimiento.efectivo = calc.calcularEfectividad(movimiento.tipoAtaque, objetivo.tipo);
   int danioCalculado = movimiento.calcularDanio();

    double modificadorDanio = 1.0;
    if (estadoActual == EstadoCondicion.quemado) {
      modificadorDanio = 0.5; 
      print("El ataque de $nombre se reduce a la mitad por la quemadura.");
    }
    int danioFinal = (danioCalculado * modificadorDanio).toInt();
    objetivo.recibirDanio(danioFinal);

    

   

    print("\n$nombre usó ${movimiento.nombreAtaque}!");
    if (movimiento.efectivo == 0) print("¡No tuvo efecto!");
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
    if(estadoActual == EstadoCondicion.congelado){
      //posibilidad de descongelarse
      if(Random().nextInt(4)==0){//25% de probabilidad
        estadoActual = EstadoCondicion.normal;
        print("$nombre se ha DESCONGELADO.");
      }
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

  void usar(PokemonBatalla objetivo);
}

// Clase base para curar HP
class Pocion extends Item {
  int cantidadCuracion;

  Pocion(this.cantidadCuracion, String nombre)
      : super(nombre, "Curación", 1, "Restaura $cantidadCuracion HP al objetivo.");

  @override
  void usar(PokemonBatalla objetivo) {
    if (objetivo.vida <= 0) {
      print("${objetivo.nombre} está fuera de combate y no puede usar ${nombreItem}.");
      return;
    }
    
    // Calcula la curación sin exceder la vida máxima
    double vidaAntes = objetivo.vida;
    double nuevaVida = vidaAntes + cantidadCuracion;
    
    if (nuevaVida > objetivo.vidaMax) {
      nuevaVida = objetivo.vidaMax;
    }

    objetivo.vida = nuevaVida;
    double hpCurado = nuevaVida - vidaAntes;

    print("${objetivo.nombre} usó ${nombreItem} y recuperó ${hpCurado.toStringAsFixed(0)} HP.");
    print("Vida actual: ${objetivo.vida.toStringAsFixed(0)}/${objetivo.vidaMax.toStringAsFixed(0)}");
  }
}

class PocionSimple extends Pocion {
  PocionSimple() : super(20, "Poción"); // Cura 20 HP
}
class SuperPocion extends Pocion {
  SuperPocion() : super(50, "Superpoción"); // Cura 50 HP
}
class Hiperpocion extends Pocion {
  Hiperpocion() : super(100, "Hiperpoción"); // Cura 100 HP
}

// Clase base para curar estados
// Clase base para curar estados específicos
abstract class CuradorEstado extends Item {
  EstadoCondicion estadoACurar;

  CuradorEstado(String nombre, String descripcion, this.estadoACurar)
      : super(nombre, "Estado", 1, descripcion);

  @override
  void usar(PokemonBatalla objetivo) {
    if (objetivo.estadoActual == estadoACurar) {
      objetivo.estadoActual = EstadoCondicion.normal;
      print("🟢 El ${nombreItem} curó el estado ${estadoACurar.name.toUpperCase()} de ${objetivo.nombre}.");
    } else {
      print("${objetivo.nombre} no está sufriendo el estado ${estadoACurar.name.toUpperCase()}.");
    }
  }
}

class Antidoto extends CuradorEstado {
  Antidoto()
      : super("Antídoto", "Cura el estado de Envenenado.", EstadoCondicion.envenenado);
}

class Antiquemar extends CuradorEstado {
  Antiquemar()
      : super("Antiquemar", "Cura el estado de Quemado.", EstadoCondicion.quemado);
}
class Despertar extends CuradorEstado {
  Despertar()
      : super("Despertar", "Cura el estado de Congelado.", EstadoCondicion.congelado);
}
class Antiparalisis extends CuradorEstado {
  Antiparalisis()
      : super("Antiparaliz", "Cura el estado de Paralizado.", EstadoCondicion.paralizado);
}