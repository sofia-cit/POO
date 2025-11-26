import '../avance/base.dart';
//lalo

// DEFINICION DE ATAQUES

//fuego
final Ataque lanzallamas = Ataque("Fuego", "Lanzallamas", 90);
final Ataque ascuas = Ataque("Fuego", "Ascuas", 40);
final Ataque giroFuego = Ataque("Fuego", "Giro Fuego", 35);

//agua
final Ataque hidrobomba = Ataque("Agua", "Hidrobomba", 110);
final Ataque surf = Ataque("Agua", "Surf", 90);
final Ataque pistolaAgua = Ataque("Agua", "Pistola Agua", 40);

//planta
final Ataque rayoSolar = Ataque("Planta", "Rayo Solar", 120);
final Ataque hojaAfilada = Ataque("Planta", "Hoja Afilada", 55);
final Ataque latigoCepa = Ataque("Planta", "Látigo Cepa", 45);

// DEFINICION DE POKEMONES

//Fuego
final PokemonBatalla charizard = PokemonBatalla("Fuego", "Charizard", 160, 50, [lanzallamas, ascuas]);
final PokemonBatalla typhlosion = PokemonBatalla("Fuego", "Typhlosion", 155, 50, [lanzallamas, giroFuego]);
final PokemonBatalla blaziken = PokemonBatalla("Fuego", "Blaziken", 150, 50, [giroFuego, ascuas]);

//Agua
final PokemonBatalla blastoise = PokemonBatalla("Agua", "Blastoise", 170, 50, [hidrobomba, pistolaAgua]);
final PokemonBatalla feraligatr = PokemonBatalla("Agua", "Feraligatr", 165, 50, [surf, pistolaAgua]);
final PokemonBatalla swampert = PokemonBatalla("Agua", "Swampert", 180, 50, [hidrobomba, surf]);

//Planta
final PokemonBatalla venusaur = PokemonBatalla("Planta", "Venusaur", 170, 50, [rayoSolar, latigoCepa]);
final PokemonBatalla meganium = PokemonBatalla("Planta", "Meganium", 165, 50, [hojaAfilada, rayoSolar]);
final PokemonBatalla sceptile = PokemonBatalla("Planta", "Sceptile", 145, 50, [hojaAfilada, latigoCepa]);

// DEFINICION DE ITEMS
class Pocion extends Item {
  int recuperacion;

  Pocion(String nombre, int cantidad, this.recuperacion)
      : super(nombre, "Salud", cantidad, "Recupera $recuperacion HP");

  @override
  void usar(Pokemon objetivo) {
    if (cantidad <= 0) {
      print("No quedan $nombreItem");
      return;
    }

    objetivo.vida += recuperacion;
    if (objetivo.vida > objetivo.vidaMax) objetivo.vida = objetivo.vidaMax;
    cantidad--;

    print("Usaste $nombreItem en ${objetivo.nombre}. Vida actual: ${objetivo.vida}");
  }
}

class CuraEstado extends Item {
  List<EstadoCondicion> curaQue;

  CuraEstado(String nombre, int cantidad, String desc, this.curaQue)
      : super(nombre, "Medicina", cantidad, desc);

  @override
  void usar(Pokemon objetivo) {
    if (cantidad <= 0) {
      print("No quedan $nombreItem");
      return;
    }

    if (objetivo is PokemonBatalla &&
        curaQue.contains(objetivo.estadoActual)) {
      objetivo.estadoActual = EstadoCondicion.normal;
      cantidad--;
      print("${objetivo.nombre} fue curado usando $nombreItem");
    } else {
      print("$nombreItem no tiene efecto");
    }
  }
}

// Ejemplos de instancias
final Pocion pocion = Pocion("Poción", 5, 20);
final CuraEstado despertar = CuraEstado("Despertar", 3, "Cura Congelado/Paralizado", [
  EstadoCondicion.congelado,
  EstadoCondicion.paralizado
]);
