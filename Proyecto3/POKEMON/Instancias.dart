import '../avance/base.dart';
//lalo

// DEFINICION DE ATAQUES

//Steel
final Ataque colaFerrea = Ataque("Steel","Cola Ferrera",100);
final Ataque garraMetal= Ataque("Steel","Garra Metal",50);
final Ataque cuerpoPesado= Ataque("Steel","Cuerpo Pesado",80);
final Ataque cabezaDeHierro= Ataque("Steel","Cabeza de Hierro",80);

//Dark
final Ataque finta= Ataque("Dark","Finta",60);
final Ataque pulsoUmbrio= Ataque("Dark","Pulso Umbrio",80);
final Ataque juegoSucio= Ataque("Dark","Juego Sucio",95);
final Ataque mordisco= Ataque("Dark","Mordisco",60);
final Ataque tajoUmbrio= Ataque("Dark","Tajo Umbrio",70);


//Dragon
final Ataque colaDragon= Ataque("Dragon","Cola Dragon",80);
final Ataque garraDragon= Ataque("Dragon","Garra Dragon",80);
final Ataque enfado=Ataque("Dragon","Enfado",120);
final Ataque vastoImpacto= Ataque("Dragon","Vasto Impacto",80);
final Ataque danzaDragon= Ataque("Dragon","Danza Dragon",20);


//Ghost
final Ataque sombraVil= Ataque("Ghost","Sombra Vil",90);
final Ataque bolaSombra= Ataque("Ghost","Bola Sombra",80);
final Ataque puasToxicas= Ataque("Ghost","Púas Tóxicas",20);//mayor probabilidad de envenenar 
final Ataque escudoReal= Ataque("Ghost","Escudo Real",10);
final Ataque fuegoFatuo= Ataque("Ghost","Fuego Fatuo",50);//mayor probabilidad de estado quemado
final Ataque infortunio= Ataque("Ghost","Infortunio",65);
final Ataque RayoConfuso= Ataque("Ghost","Rayo Confuso",40);//mayor probabilidad de estado confuso

//Rock
final Ataque rocaAfilada= Ataque("Rock","Roca Afilada",100);
final Ataque triturar= Ataque("Rock","Triturar",80);
final Ataque trampaRocas= Ataque("Rock","Trampa Rocas",15);//mayor probabilidad estado
final Ataque explosion= Ataque("Rock","Explosión",150);
final Ataque avalancha= Ataque("Rock","Avalancha",75);
final Ataque romperrocas= Ataque("Rock","Romperrocas",40);
final Ataque cuernoTaladro= Ataque("Rock","Cuerno Taladros",50);
final Ataque cabezazoRoca= Ataque("Rock","Cabezazo Roca",150);

//Bug
final Ataque IdaYVuelta= Ataque("Bug","Ida y Vuelta",70);
final Ataque punoBala= Ataque("Bug","Puño Bala",40);
final Ataque danzaEspada= Ataque("Bug","Danza Espada",20);//mayor probabilidad estado
final Ataque zumbido= Ataque("Bug","Zumbido",90);
final Ataque danzaAleteo= Ataque("Bug","Danza Aleteo",20);//mayor probabilidad estado
final Ataque vendavalB= Ataque("Bug","Vendaval",110);
final Ataque tijeraX= Ataque("Bug","Tijera X",80);
final Ataque megacuerno= Ataque("Bug","Megacuerno",120);
final Ataque bocajarro= Ataque("Bug","Bocajarro",110);


//Psycho
final Ataque psiquico= Ataque("Psycho","Psíquico",90);
final Ataque confusion= Ataque("Psycho","Confusión",50);
final Ataque psicoCorte= Ataque("Psycho","Psico Corte",70);
final Ataque ondaMental= Ataque("Psycho","Onda Mental",90);
final Ataque psicorrayo= Ataque("Psycho","Psicorrayo",65);
final Ataque paranormal= Ataque("Psycho","Paranormal",65);


//Flying
final Ataque tornado= Ataque("Flying","Tornado",40);
final Ataque ataqueAla= Ataque("Flying","Ataque Ala",60);
final Ataque pajaroOsado= Ataque("Flying","Pájaro Osado",120);
final Ataque alaMortifera= Ataque("Flying","Ala Mortífera",80);
final Ataque vendavalF= Ataque("Flying","Golpe Cabeza",110);
final Ataque AireAfilado= Ataque("Flying","Aire Afilado",75);
final Ataque danzaPluma= Ataque("Flying","Danza Pluma",20);//mayor probabilidad estado

// Ground
final Ataque bofetonLodo= Ataque("Ground", "Bofeton Lodo",55);
final Ataque disparoLodo= Ataque("Ground", "Disparo Lodo",55);
final Ataque bombaFango= Ataque("Ground", "Bomba Fango",65);
final Ataque terremoto= Ataque("Ground", "Terremoto",100);
final Ataque arenasArdientes= Ataque("Ground", "Arenas Ardientes",70);
final Ataque ataqueArena= Ataque("Ground", "Ataque Arena",20);//mayor probabilidad estado
final Ataque terratemblor= Ataque("Ground", "Terratemblor",60);

//Poison
final Ataque picotazoVenenoso= Ataque ("Poison","Picotazo Venenoso", 45);
final Ataque deslumbrar= Ataque ("Poison","Deslumbrar", 30);//mayor probabilidad estado paralizado
final Ataque acido= Ataque ("Poison","Acido", 40);//mayor probabilidad estado
final Ataque doblePatada= Ataque ("Poison","Doble Patada", 70);
final Ataque colaVeneno= Ataque("Poison","Cola Veneno", 50);
final Ataque niebla= Ataque ("Poison","niebla", 15);//mayor probabilidad estado
final Ataque colmilloVenenoso= Ataque ("Poison","Colmillo Venenoso", 90);

//Fight
final Ataque patadaBaja= Ataque ("Fight","Patada Baja", 60);
final Ataque Aranazo= Ataque ("Fight","Arañazo", 40);
final Ataque golpesFuria= Ataque ("Fight","Golpe Furia", 50);
final Ataque golpeKarate= Ataque ("Fight","Golpe Karate", 50);
final Ataque movimientoSismico= Ataque ("Fight","Movimiento Sismico", 80);
final Ataque Sumision= Ataque ("Fight","Sumision", 80);
final Ataque patadaSalto= Ataque ("Fight","Patada Salto", 100);
final Ataque patadaGiro= Ataque ("Fight","Patada Giro", 60);

//Ice
final Ataque punoHielo= Ataque ("Ice","Puño Hielo", 75);
final Ataque besoAmoroso= Ataque ("Ice","Beso Amoroso",15);//mayor probabilidad estado
final Ataque dobleBofeton= Ataque ("Ice","Doble Bofeton", 65);
final Ataque rayoHielo= Ataque ("Ice","Rayo Hielo", 90);
final Ataque canto= Ataque ("Ice","Canto", 20);//mayor probabilidad estado
final Ataque neblina= Ataque ("Ice","Neblina", 40);
final Ataque rayoAurora= Ataque ("Ice","Rayo Aurora", 65);
final Ataque descanso= Ataque ("Ice","Descanso", 20);//mayor probabilidad estado
final Ataque derribo= Ataque ("Ice","Derribo", 90);


//Grass


//electric


//water
final Ataque hidrobomba = Ataque("Agua", "Hidrobomba", 110);
final Ataque surf = Ataque("Agua", "Surf", 90);
final Ataque pistolaAgua = Ataque("Agua", "Pistola Agua", 40);

//fire
final Ataque lanzallamas = Ataque("Fire", "Lanzallamas", 90);
final Ataque ascuas = Ataque("Fire", "Ascuas", 40);
final Ataque giroFuego = Ataque("Fire", "Giro Fuego", 35);


//Normal
final Ataque golpeNormal= Ataque("Normal","Golpe Normal",50);
final Ataque hiperRayo= Ataque("Normal","Hiper Rayo",150);
final Ataque cuerpoNormal= Ataque("Normal","Cuerpo Normal",70);


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
//final PokemonBatalla venusaur = PokemonBatalla("Planta", "Venusaur", 170, 50, [rayoSolar, latigoCepa]);
//final PokemonBatalla meganium = PokemonBatalla("Planta", "Meganium", 165, 50, [hojaAfilada, rayoSolar]);
//final PokemonBatalla sceptile = PokemonBatalla("Planta", "Sceptile", 145, 50, [hojaAfilada, latigoCepa]);

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

final Pocion pocion = Pocion("Poción", 5, 20);
final CuraEstado despertar = CuraEstado("Despertar", 3, "Cura Congelado/Paralizado", [
  EstadoCondicion.congelado,
  EstadoCondicion.paralizado
]);
