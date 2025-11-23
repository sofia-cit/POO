import 'dart:io';
import 'dart:math';

abstract class Combate {
  void atacar(Pokemon objetivo, Ataque movimiento);
}

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

class Ataque {
  String tipoAtaque;
  String nombreAtaque;
  int danio;
  double efectivo = 1.0;

  Ataque(this.tipoAtaque, this.nombreAtaque, this.danio);

  int calcularDanio() {
    return (efectivo * danio).toInt();
  }
}

class Efectividad {
  double calcularEfectividad(String tipoAtaque, String tipoEnemigo) {
    double factor = 1.0;

    if (tipoAtaque == "Fuego") {
      if (tipoEnemigo == "Planta") factor = 2.0;
      if (tipoEnemigo == "Agua") factor = 0.5;
    } 
    else if (tipoAtaque == "Agua") {
      if (tipoEnemigo == "Fuego") factor = 2.0;
      if (tipoEnemigo == "Planta") factor = 0.5;
    }
    else if (tipoAtaque == "Planta") {
      if (tipoEnemigo == "Agua") factor = 2.0;
      if (tipoEnemigo == "Fuego") factor = 0.5;
    }
    else if (tipoAtaque == "Electrico") {
      if (tipoEnemigo == "Agua") factor = 2.0;
      if (tipoEnemigo == "Planta") factor = 0.5; 
    }
    
    return factor;
  }
}

abstract class Item {
  String nombreItem;
  String tipoItem;
  int cantidad;
  String descripcion;

  Item(this.nombreItem, this.tipoItem, this.cantidad, this.descripcion);

  void usar(Pokemon objetivo);
}

enum EstadoCondicion {
  normal,
  quemado,
  envenenado,
  congelado,
  paralizado
}

class PokemonBatalla extends Pokemon {
  EstadoCondicion estadoActual = EstadoCondicion.normal;
  List<Ataque> misAtaques; 

  PokemonBatalla(String tipo, String nombre, num vidaInput, int nivel, this.misAtaques)
      : super(tipo, nombre, vidaInput, nivel);

  @override
  void atacar(Pokemon objetivo, Ataque movimiento) {
    
    if (estadoActual == EstadoCondicion.congelado) {
      print("¡$nombre está CONGELADO y no se puede mover!");
      return;
    }
    
    if (estadoActual == EstadoCondicion.paralizado) {
      if (Random().nextInt(5) == 0) {
        print("¡$nombre está PARALIZADO y no puede atacar!");
        return;
      }
    }

    Efectividad calc = Efectividad();
    double multi = calc.calcularEfectividad(movimiento.tipoAtaque, objetivo.tipo);
    movimiento.efectivo = multi;

    int danioFinal = movimiento.calcularDanio();

    objetivo.recibirDanio(danioFinal);

    print("\n$nombre usó ${movimiento.nombreAtaque}!");
    if (multi > 1.0) print("¡Es muy eficaz! (x$multi)");
    if (multi < 1.0) print("No es muy eficaz... (x$multi)");
    print("Daño: $danioFinal. Vida de ${objetivo.nombre}: ${objetivo.vida}/${objetivo.vidaMax}");
  }

  void finDeTurno() {
    if (estadoActual == EstadoCondicion.quemado) {
      int d = (vidaMax * 0.06).toInt();
      recibirDanio(d);
      print("$nombre sufre daño por quemadura (-$d HP).");
    }
    if (estadoActual == EstadoCondicion.envenenado) {
      int d = (vidaMax * 0.12).toInt();
      recibirDanio(d);
      print("$nombre sufre daño por veneno (-$d HP).");
    }
  }
}

class Pocion extends Item {
  int recuperacion;

  Pocion(String nombre, int cantidad, this.recuperacion) 
      : super(nombre, "Salud", cantidad, "Recupera $recuperacion HP");

  @override
  void usar(Pokemon objetivo) {
    if (cantidad > 0) {
      objetivo.vida += recuperacion;
      if (objetivo.vida > objetivo.vidaMax) objetivo.vida = objetivo.vidaMax;
      cantidad--;
      print("\nUsaste $nombreItem en ${objetivo.nombre}. Vida: ${objetivo.vida}");
    } else {
      print("¡No te quedan $nombreItem!");
    }
  }
}

class CuraEstado extends Item {
  List<EstadoCondicion> curaQue;

  CuraEstado(String nombre, int cantidad, String desc, this.curaQue)
      : super(nombre, "Medicina", cantidad, desc);

  @override
  void usar(Pokemon objetivo) {
    if (cantidad > 0) {
      if (objetivo is PokemonBatalla) {
        if (curaQue.contains(objetivo.estadoActual)) {
          objetivo.estadoActual = EstadoCondicion.normal;
          cantidad--;
          print("\n¡${objetivo.nombre} se curó de su estado usando $nombreItem!");
        } else {
          print("\n$nombreItem no tiene efecto en el estado actual de ${objetivo.nombre}.");
        }
      }
    } else {
      print("¡No te quedan $nombreItem!");
    }
  }
}

void main() {
  Ataque lanzallamas = Ataque("Fuego", "Lanzallamas", 90);
  Ataque ascuas = Ataque("Fuego", "Ascuas", 40);
  Ataque giroFuego = Ataque("Fuego", "Giro Fuego", 35);

  Ataque hidrobomba = Ataque("Agua", "Hidrobomba", 110);
  Ataque surf = Ataque("Agua", "Surf", 90);
  Ataque pistolaAgua = Ataque("Agua", "Pistola Agua", 40);

  Ataque rayoSolar = Ataque("Planta", "Rayo Solar", 120);
  Ataque hojaAfilada = Ataque("Planta", "Hoja Afilada", 55);
  Ataque latigoCepa = Ataque("Planta", "Látigo Cepa", 45);

  PokemonBatalla charizard = PokemonBatalla("Fuego", "Charizard", 160, 50, [lanzallamas, ascuas]);
  PokemonBatalla typhlosion = PokemonBatalla("Fuego", "Typhlosion", 155, 50, [lanzallamas, giroFuego]);
  PokemonBatalla blaziken = PokemonBatalla("Fuego", "Blaziken", 150, 50, [giroFuego, ascuas]);

  PokemonBatalla blastoise = PokemonBatalla("Agua", "Blastoise", 170, 50, [hidrobomba, pistolaAgua]);
  PokemonBatalla feraligatr = PokemonBatalla("Agua", "Feraligatr", 165, 50, [surf, pistolaAgua]);
  PokemonBatalla swampert = PokemonBatalla("Agua", "Swampert", 180, 50, [hidrobomba, surf]);

  PokemonBatalla venusaur = PokemonBatalla("Planta", "Venusaur", 170, 50, [rayoSolar, latigoCepa]);
  PokemonBatalla meganium = PokemonBatalla("Planta", "Meganium", 165, 50, [hojaAfilada, rayoSolar]);
  PokemonBatalla sceptile = PokemonBatalla("Planta", "Sceptile", 145, 50, [hojaAfilada, latigoCepa]);

  Pocion pocion = Pocion("Poción", 5, 20);
  CuraEstado despertar = CuraEstado("Despertar", 3, "Cura Sueño/Congelado", [EstadoCondicion.congelado, EstadoCondicion.paralizado]);

  print("--- INICIO BATALLA ---");
  
  blastoise.atacar(charizard, hidrobomba);

  charizard.atacar(blastoise, lanzallamas);

  print("\n--- Charizard ha sido CONGELADO ---");
  charizard.estadoActual = EstadoCondicion.congelado;

  charizard.atacar(blastoise, lanzallamas); 

  print("\n--- Usando Item Despertar ---");
  despertar.usar(charizard); 

  charizard.atacar(blastoise, lanzallamas); 
}