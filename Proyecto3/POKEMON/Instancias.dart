import 'Base.dart'; 
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
final Ataque puasToxicas= Ataque("Ghost","Púas Tóxicas",20);
final Ataque escudoReal= Ataque("Ghost","Escudo Real",10);
final Ataque fuegoFatuo= Ataque("Ghost","Fuego Fatuo",50);
final Ataque infortunio= Ataque("Ghost","Infortunio",65);
final Ataque rayoConfuso= Ataque("Ghost","Rayo Confuso",40);

//Rock
final Ataque rocaAfilada= Ataque("Rock","Roca Afilada",100);
final Ataque triturar= Ataque("Rock","Triturar",80);
final Ataque trampaRocas= Ataque("Rock","Trampa Rocas",15);
final Ataque explosion= Ataque("Rock","Explosión",150);
final Ataque avalancha= Ataque("Rock","Avalancha",75);
final Ataque romperrocas= Ataque("Rock","Romperrocas",40);
final Ataque cuernoTaladro= Ataque("Rock","Cuerno Taladros",50);
final Ataque cabezazoRoca= Ataque("Rock","Cabezazo Roca",150);

//Bug
final Ataque idaYVuelta= Ataque("Bug","Ida y Vuelta",70);
final Ataque punoBala= Ataque("Bug","Puño Bala",40);
final Ataque danzaEspada= Ataque("Bug","Danza Espada",20);
final Ataque zumbido= Ataque("Bug","Zumbido",90);
final Ataque danzaAleteo= Ataque("Bug","Danza Aleteo",20);
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
final Ataque vendavalF= Ataque("Flying","Vendaval",110);
final Ataque aireAfilado= Ataque("Flying","Aire Afilado",75);
final Ataque danzaPluma= Ataque("Flying","Danza Pluma",20);

//Ground
final Ataque bofetonLodo= Ataque("Ground", "Bofeton Lodo",55);
final Ataque disparoLodo= Ataque("Ground", "Disparo Lodo",55);
final Ataque bombaFango= Ataque("Ground", "Bomba Fango",65);
final Ataque terremoto= Ataque("Ground", "Terremoto",100);
final Ataque arenasArdientes= Ataque("Ground", "Arenas Ardientes",70);
final Ataque ataqueArena= Ataque("Ground", "Ataque Arena",20);
final Ataque terratemblor= Ataque("Ground", "Terratemblor",60);

//Poison
final Ataque picotazoVenenoso= Ataque ("Poison","Picotazo Venenoso", 45);
final Ataque deslumbrar= Ataque ("Poison","Deslumbrar", 30);
final Ataque acido= Ataque ("Poison","Acido", 40);
final Ataque doblePatada= Ataque ("Poison","Doble Patada", 70);
final Ataque colaVeneno= Ataque("Poison","Cola Veneno", 50);
final Ataque niebla= Ataque ("Poison","niebla", 15);
final Ataque colmilloVenenoso= Ataque ("Poison","Colmillo Venenoso", 90);

//Fight
final Ataque patadaBaja= Ataque ("Fight","Patada Baja", 60);
final Ataque aranazo= Ataque ("Fight","Arañazo", 40);
final Ataque golpesFuria= Ataque ("Fight","Golpe Furia", 50);
final Ataque golpeKarate= Ataque ("Fight","Golpe Karate", 50);
final Ataque movimientoSismico= Ataque ("Fight","Movimiento Sismico", 80);
final Ataque sumision= Ataque ("Fight","Sumision", 80);
final Ataque patadaSalto= Ataque ("Fight","Patada Salto", 100);
final Ataque patadaGiro= Ataque ("Fight","Patada Giro", 60);

//Ice
final Ataque punoHielo= Ataque ("Ice","Puño Hielo", 75);
final Ataque besoAmoroso= Ataque ("Ice","Beso Amoroso",15);
final Ataque dobleBofeton= Ataque ("Ice","Doble Bofeton", 65);
final Ataque rayoHielo= Ataque ("Ice","Rayo Hielo", 90);
final Ataque canto= Ataque ("Ice","Canto", 20);
final Ataque neblina= Ataque ("Ice","Neblina", 40);
final Ataque rayoAurora= Ataque ("Ice","Rayo Aurora", 65);
final Ataque descanso= Ataque ("Ice","Descanso", 20);
final Ataque derribo= Ataque ("Ice","Derribo", 90);

//Grass
final Ataque latigoCepa = Ataque("Grass", "Látigo Cepa", 45);
final Ataque drenadoras = Ataque("Grass", "Drenadoras", 20);
final Ataque hojaAfilada = Ataque("Grass", "Hoja Afilada", 55);
final Ataque absorber = Ataque("Grass", "Absorber", 20);
final Ataque polvoVeneno = Ataque("Grass", "Polvo Veneno", 10);
final Ataque danzaPetalo = Ataque("Grass", "Danza Pétalo", 120);
final Ataque constriccion = Ataque("Grass", "Constricción", 15);
final Ataque paralizador = Ataque("Grass", "Paralizador", 10);
final Ataque latigazo = Ataque("Grass", "Latigazo", 80);

//Electric
final Ataque impactrueno = Ataque("Electric", "Impactrueno", 40);
final Ataque voltioCruel = Ataque("Electric", "Voltio Cruel", 90);
final Ataque chispazo = Ataque("Electric", "Chispazo", 80);
final Ataque rayo = Ataque("Electric", "Rayo", 90);
final Ataque voltiocambio = Ataque("Electric", "Voltiocambio", 70);
final Ataque electrocanon = Ataque("Electric", "Electrocañón", 120);

//Water
final Ataque hidrobomba = Ataque("Water", "Hidrobomba", 110);
final Ataque surf = Ataque("Water", "Surf", 90);
final Ataque pistolaAgua = Ataque("Water", "Pistola Agua", 40);
// Añadidos para cubrir necesidades de los pokemones:
final Ataque burbuja = Ataque("Water", "Burbuja", 40);
final Ataque acuaCola = Ataque("Water", "Acua Cola", 90);
final Ataque hidropulso = Ataque("Water", "Hidropulso", 60);
final Ataque rayoBurbuja = Ataque("Water", "Rayo Burbuja", 65);
final Ataque escaldar = Ataque("Water", "Escaldar", 80);


// --- Fire ---
final Ataque lanzallamas = Ataque("Fire", "Lanzallamas", 90);
final Ataque ascuas = Ataque("Fire", "Ascuas", 40);
final Ataque giroFuego = Ataque("Fire", "Giro Fuego", 35);
// Añadidos:
final Ataque nitrocarga = Ataque("Fire", "Nitrocarga", 50);
final Ataque llamarada = Ataque("Fire", "Llamarada", 110);
final Ataque colmilloIgneo = Ataque("Fire", "Colmillo Ígneo", 65);
final Ataque calcinacion = Ataque("Fire", "Calcinación", 60);

// --- Normal ---
final Ataque golpeNormal= Ataque("Normal","Golpe Normal",50);
final Ataque hiperRayo= Ataque("Normal","Hiper Rayo",150);
final Ataque cuerpoNormal= Ataque("Normal","Cuerpo Normal",70);
// Añadidos:
final Ataque ataqueRapido = Ataque("Normal", "Ataque Rápido", 40);
final Ataque placaje = Ataque("Normal", "Placaje", 40);
final Ataque hipercolmillo = Ataque("Normal", "Hipercolmillo", 80);
final Ataque golpeCuerpo = Ataque("Normal", "Golpe Cuerpo", 85);
final Ataque frustracion = Ataque("Normal", "Frustración", 60);



// DEFINICION DE POKEMONES
// CORRECCIÓN: Se añade el quinto argumento (Velocidad) a todos los constructores de PokemonBatalla.

//Steel
final PokemonBatalla lairon = PokemonBatalla("Steel", "Lairon", 120, 40, 50, [colaFerrea, garraMetal, cuerpoPesado]);
final PokemonBatalla aggron = PokemonBatalla("Steel", "Aggron", 160, 30, 70, [cuerpoPesado, colaFerrea]);
final PokemonBatalla aron = PokemonBatalla("Steel", "Aron", 100, 30, 30, [cabezaDeHierro, garraMetal]);

//Dark
final PokemonBatalla zorua = PokemonBatalla("Dark", "Zorua", 90, 65, 80, [finta, pulsoUmbrio, juegoSucio]);
final PokemonBatalla zweilous = PokemonBatalla("Dark", "Zweilous", 130, 50, 60, [mordisco, pulsoUmbrio, tajoUmbrio]);
final PokemonBatalla zarude = PokemonBatalla("Dark", "Zarude", 150, 80, 105, [mordisco, pulsoUmbrio, tajoUmbrio]);

//Dragon
final PokemonBatalla flygon = PokemonBatalla("Dragon", "Flygon", 140, 80, 100, [colaDragon, garraDragon]);
final PokemonBatalla rayquaza = PokemonBatalla("Dragon", "Rayquaza", 180, 95, 95, [colaDragon, enfado, vastoImpacto]);
final PokemonBatalla dragapult = PokemonBatalla("Dragon", "Dragapult", 130, 100, 142, [vastoImpacto, enfado, colaDragon]); // Alta Velocidad

//Ghost
final PokemonBatalla gengar = PokemonBatalla("Ghost", "Gengar", 120, 90, 110, [bolaSombra, puasToxicas]);
final PokemonBatalla aegislash = PokemonBatalla("Ghost", "Aegislash", 140, 50, 60, [tajoUmbrio, sombraVil, escudoReal]);
final PokemonBatalla chandelure = PokemonBatalla("Ghost", "Chandelure", 125, 60, 80, [fuegoFatuo, infortunio, rayoConfuso]);

//Rock
final PokemonBatalla tyranitar = PokemonBatalla("Rock", "Tyranitar", 170, 50, 61, [rocaAfilada, triturar, danzaDragon]);
final PokemonBatalla golemRock = PokemonBatalla("Rock", "Golem", 140, 40, 45, [trampaRocas, explosion, avalancha]);
final PokemonBatalla rhyperior = PokemonBatalla("Rock", "Rhyperior", 160, 35, 40, [romperrocas, cuernoTaladro, cabezazoRoca]);

//Bug
final PokemonBatalla scizor = PokemonBatalla("Bug", "Scizor", 130, 60, 65, [idaYVuelta, punoBala, danzaEspada]);
final PokemonBatalla volcarona = PokemonBatalla("Bug", "Volcarona", 140, 80, 100, [zumbido, danzaAleteo, vendavalB]);
final PokemonBatalla heracross = PokemonBatalla("Bug", "Heracross", 135, 70, 85, [tijeraX, megacuerno, bocajarro]);

//Psycho
final PokemonBatalla alakazam = PokemonBatalla("Psycho", "Alakazam", 110, 95, 120, [psiquico, confusion, psicoCorte]);
final PokemonBatalla mewtwo = PokemonBatalla("Psycho", "Mewtwo", 180, 100, 130, [ondaMental, confusion, psicoCorte]);
final PokemonBatalla baltoy = PokemonBatalla("Psycho", "Baltoy", 90, 45, 50, [confusion, psicorrayo, paranormal]);

//Flying
final PokemonBatalla staraptor = PokemonBatalla("Flying", "Staraptor", 130, 85, 100, [tornado, ataqueAla, pajaroOsado]);
final PokemonBatalla yveltal = PokemonBatalla("Flying", "Yveltal", 170, 90, 99, [alaMortifera, vendavalF, tornado]);
final PokemonBatalla pidgeot = PokemonBatalla("Flying", "Pidgeot", 140, 80, 101, [aireAfilado, pajaroOsado, danzaPluma]);

//Ground
final PokemonBatalla diglett = PokemonBatalla("Ground", "Diglett", 80, 70, 95, [bofetonLodo, disparoLodo, bombaFango]);
final PokemonBatalla golemGround = PokemonBatalla("Ground", "Golem (Tierra)", 140, 40, 45, [terremoto, disparoLodo, bofetonLodo]);
final PokemonBatalla sandslash = PokemonBatalla("Ground", "Sandslash", 125, 60, 65, [arenasArdientes, ataqueArena, terratemblor]);

//Poison
final PokemonBatalla ekans = PokemonBatalla("Poison", "Ekans", 90, 50, 55, [picotazoVenenoso, deslumbrar, acido]);
final PokemonBatalla nidorina = PokemonBatalla("Poison", "Nidorina", 120, 55, 56, [doblePatada, picotazoVenenoso, mordisco]);
final PokemonBatalla seviper = PokemonBatalla("Poison", "Seviper", 130, 60, 65, [colaVeneno, niebla, colmilloVenenoso]);

//Fight
final PokemonBatalla mankey = PokemonBatalla("Fight", "Mankey", 100, 70, 70, [patadaBaja, aranazo, golpesFuria]);
final PokemonBatalla machop = PokemonBatalla("Fight", "Machop", 110, 45, 35, [golpeKarate, movimientoSismico, sumision]);
final PokemonBatalla hitmonlee = PokemonBatalla("Fight", "Hitmonlee", 120, 75, 87, [doblePatada, patadaSalto, patadaGiro]);

//Ice
final PokemonBatalla jynx = PokemonBatalla("Ice", "Jynx", 110, 70, 95, [punoHielo, besoAmoroso, dobleBofeton]);
final PokemonBatalla lapras = PokemonBatalla("Ice", "Lapras", 180, 50, 60, [rayoHielo, canto, neblina]);
final PokemonBatalla dewgong = PokemonBatalla("Ice", "Dewgong", 150, 60, 70, [rayoAurora, descanso, derribo]);

//Grass
final PokemonBatalla bulbasaur = PokemonBatalla("Grass", "Bulbasaur", 110, 45, 45, [latigoCepa, drenadoras, hojaAfilada]);
final PokemonBatalla oddish = PokemonBatalla("Grass", "Oddish", 90, 40, 30, [absorber, polvoVeneno, danzaPetalo]);
final PokemonBatalla tangela = PokemonBatalla("Grass", "Tangela", 120, 55, 60, [constriccion, paralizador, latigazo]);

//Electric
final PokemonBatalla pikachu = PokemonBatalla("Electric", "Pikachu", 90, 90, 90, [impactrueno, voltioCruel, chispazo]);
final PokemonBatalla magnemite = PokemonBatalla("Electric", "Magnemite", 80, 45, 45, [impactrueno, chispazo, rayo]);
final PokemonBatalla jolteon = PokemonBatalla("Electric", "Jolteon", 130, 100, 130, [voltiocambio, impactrueno, electrocanon]);

//Water
final PokemonBatalla squirtle = PokemonBatalla("Water", "Squirtle", 110, 43, 43, [burbuja, acuaCola, hidropulso]);
final PokemonBatalla poliwhirl = PokemonBatalla("Water", "Poliwhirl", 120, 60, 70, [burbuja, rayoBurbuja, escaldar]);
final PokemonBatalla vaporeon = PokemonBatalla("Water", "Vaporeon", 180, 65, 65, [acuaCola, hidropulso, escaldar]);
final PokemonBatalla blastoise = PokemonBatalla("Water", "Blastoise", 170, 50, 78, [hidrobomba, pistolaAgua]);
final PokemonBatalla feraligatr = PokemonBatalla("Water", "Feraligatr", 165, 50, 78, [surf, pistolaAgua]);
final PokemonBatalla swampert = PokemonBatalla("Water", "Swampert", 180, 50, 60, [hidrobomba, surf]);

//Fire
final PokemonBatalla charmander = PokemonBatalla("Fire", "Charmander", 90, 60, 65, [ascuas, lanzallamas, nitrocarga]);
final PokemonBatalla arcanine = PokemonBatalla("Fire", "Arcanine", 160, 85, 95, [lanzallamas, llamarada, colmilloIgneo]);
final PokemonBatalla rapidash = PokemonBatalla("Fire", "Rapidash", 140, 95, 105, [llamarada, nitrocarga, calcinacion]);
final PokemonBatalla charizard = PokemonBatalla("Fire", "Charizard", 160, 50, 100, [lanzallamas, ascuas]);
final PokemonBatalla typhlosion = PokemonBatalla("Fire", "Typhlosion", 155, 50, 100, [lanzallamas, giroFuego]);
final PokemonBatalla blaziken = PokemonBatalla("Fire", "Blaziken", 150, 50, 80, [giroFuego, ascuas]);

//Normal
final PokemonBatalla rattata = PokemonBatalla("Normal", "Rattata", 80, 72, 72, [ataqueRapido, placaje, hipercolmillo]);
final PokemonBatalla meowth = PokemonBatalla("Normal", "Meowth", 90, 90, 90, [aranazo, golpeCuerpo, frustracion]);
final PokemonBatalla evee = PokemonBatalla("Normal", "Eevee", 110, 55, 55, [ataqueRapido, placaje, golpeCuerpo]);



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
    if (objetivo is! PokemonBatalla) {
      print("Error: $nombreItem solo puede usarse en un Pokémon en batalla.");
      return;
    }

    if (curaQue.contains(objetivo.estadoActual)) {
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