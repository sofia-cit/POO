import 'Base.dart'; 


//DEFINICION DE ATAQUES

//Steel

final Ataque colaFerrea = Ataque("Steel","Cola Ferrera",100,0);
final Ataque garraMetal= Ataque("Steel","Garra Metal",50,30);
final Ataque cuerpoPesado= Ataque("Steel","Cuerpo Pesado",80,0);
final Ataque cabezaDeHierro= Ataque("Steel","Cabeza de Hierro",80,0);

//Dark
final Ataque finta= Ataque("Dark","Finta",60,10);
final Ataque pulsoUmbrio= Ataque("Dark","Pulso Umbrio",80,0);
final Ataque juegoSucio= Ataque("Dark","Juego Sucio",95,0);
final Ataque mordisco= Ataque("Dark","Mordisco",60,20);
final Ataque tajoUmbrio= Ataque("Dark","Tajo Umbrio",70,0);

//Dragon
final Ataque colaDragon= Ataque("Dragon","Cola Dragon",80,0);
final Ataque garraDragon= Ataque("Dragon","Garra Dragon",80,0);
final Ataque enfado=Ataque("Dragon","Enfado",120,0);
final Ataque vastoImpacto= Ataque("Dragon","Vasto Impacto",80,0);
final Ataque danzaDragon= Ataque("Dragon","Danza Dragon",20,50);

//Ghost
final Ataque sombraVil= Ataque("Ghost","Sombra Vil",90,0);
final Ataque bolaSombra= Ataque("Ghost","Bola Sombra",80,0);
final Ataque puasToxicas= Ataque("Ghost","Púas Tóxicas",20,50);
final Ataque escudoReal= Ataque("Ghost","Escudo Real",10,75);
final Ataque fuegoFatuo= Ataque("Ghost","Fuego Fatuo",50,10);
final Ataque infortunio= Ataque("Ghost","Infortunio",65,0);
final Ataque rayoConfuso= Ataque("Ghost","Rayo Confuso",40,20);

//Rock
final Ataque rocaAfilada= Ataque("Rock","Roca Afilada",100,0);
final Ataque triturar= Ataque("Rock","Triturar",80,0);
final Ataque trampaRocas= Ataque("Rock","Trampa Rocas",15,50);
final Ataque explosion= Ataque("Rock","Explosión",150,0);
final Ataque avalancha= Ataque("Rock","Avalancha",75,0);
final Ataque romperrocas= Ataque("Rock","Romperrocas",40,20);
final Ataque cuernoTaladro= Ataque("Rock","Cuerno Taladros",50,10);
final Ataque cabezazoRoca= Ataque("Rock","Cabezazo Roca",150,0);

//Bug
final Ataque idaYVuelta= Ataque("Bug","Ida y Vuelta",70,0);
final Ataque punoBala= Ataque("Bug","Puño Bala",40,20);
final Ataque danzaEspada= Ataque("Bug","Danza Espada",20,60);
final Ataque zumbido= Ataque("Bug","Zumbido",90,0);
final Ataque danzaAleteo= Ataque("Bug","Danza Aleteo",20,60);
final Ataque vendavalB= Ataque("Bug","Vendaval",110,0);
final Ataque tijeraX= Ataque("Bug","Tijera X",80,0);
final Ataque megacuerno= Ataque("Bug","Megacuerno",120,0);
final Ataque bocajarro= Ataque("Bug","Bocajarro",110,0);

//Psycho
final Ataque psiquico= Ataque("Psycho","Psíquico",90,0);
final Ataque confusion= Ataque("Psycho","Confusión",50,10);
final Ataque psicoCorte= Ataque("Psycho","Psico Corte",70,0);
final Ataque ondaMental= Ataque("Psycho","Onda Mental",90,0);
final Ataque psicorrayo= Ataque("Psycho","Psicorrayo",65,10);
final Ataque paranormal= Ataque("Psycho","Paranormal",65,0);

//Flying
final Ataque tornado= Ataque("Flying","Tornado",40,10);
final Ataque ataqueAla= Ataque("Flying","Ataque Ala",60,0);
final Ataque pajaroOsado= Ataque("Flying","Pájaro Osado",120,0);
final Ataque alaMortifera= Ataque("Flying","Ala Mortífera",80,0);
final Ataque vendavalF= Ataque("Flying","Vendaval",110,0);
final Ataque aireAfilado= Ataque("Flying","Aire Afilado",75,0);
final Ataque danzaPluma= Ataque("Flying","Danza Pluma",20,50);

//Ground
final Ataque bofetonLodo= Ataque("Ground", "Bofeton Lodo",55,5);
final Ataque disparoLodo= Ataque("Ground", "Disparo Lodo",55,5);
final Ataque bombaFango= Ataque("Ground", "Bomba Fango",65,0);
final Ataque terremoto= Ataque("Ground", "Terremoto",100,0);
final Ataque arenasArdientes= Ataque("Ground", "Arenas Ardientes",70,0);
final Ataque ataqueArena= Ataque("Ground", "Ataque Arena",20,70);
final Ataque terratemblor= Ataque("Ground", "Terratemblor",60,0);

//Poison
final Ataque picotazoVenenoso= Ataque ("Poison","Picotazo Venenoso", 45,0);
final Ataque deslumbrar= Ataque ("Poison","Deslumbrar", 30,40);
final Ataque acido= Ataque ("Poison","Acido", 40,30);
final Ataque doblePatada= Ataque ("Poison","Doble Patada", 70,0);
final Ataque colaVeneno= Ataque("Poison","Cola Veneno", 50,15);
final Ataque niebla= Ataque ("Poison","niebla", 15,70);
final Ataque colmilloVenenoso= Ataque ("Poison","Colmillo Venenoso", 90,0);

//Fight
final Ataque patadaBaja= Ataque ("Fight","Patada Baja", 60,0);
final Ataque aranazo= Ataque ("Fight","Arañazo", 40,0);
final Ataque golpesFuria= Ataque ("Fight","Golpe Furia", 50,0);
final Ataque golpeKarate= Ataque ("Fight","Golpe Karate", 50,0);
final Ataque movimientoSismico= Ataque ("Fight","Movimiento Sismico", 80,0);
final Ataque sumision= Ataque ("Fight","Sumision", 80,0);
final Ataque patadaSalto= Ataque ("Fight","Patada Salto", 100,0);
final Ataque patadaGiro= Ataque ("Fight","Patada Giro", 60,0);

//Ice
final Ataque punoHielo= Ataque ("Ice","Puño Hielo", 75,0);
final Ataque besoAmoroso= Ataque ("Ice","Beso Amoroso",15,40);
final Ataque dobleBofeton= Ataque ("Ice","Doble Bofeton", 65,0);
final Ataque rayoHielo= Ataque ("Ice","Rayo Hielo", 90,0);
final Ataque canto= Ataque ("Ice","Canto", 20,50);
final Ataque neblina= Ataque ("Ice","Neblina", 40,20);
final Ataque rayoAurora= Ataque ("Ice","Rayo Aurora", 65,0);
final Ataque descanso= Ataque ("Ice","Descanso", 20,75);
final Ataque derribo= Ataque ("Ice","Derribo", 90,0);

//Grass
final Ataque latigoCepa = Ataque("Grass", "Látigo Cepa", 45,0);
final Ataque drenadoras = Ataque("Grass", "Drenadoras", 20,50);
final Ataque hojaAfilada = Ataque("Grass", "Hoja Afilada", 55,0);
final Ataque absorber = Ataque("Grass", "Absorber", 20,60);
final Ataque polvoVeneno = Ataque("Grass", "Polvo Veneno", 10,75);
final Ataque danzaPetalo = Ataque("Grass", "Danza Pétalo", 120,0);
final Ataque constriccion = Ataque("Grass", "Constricción", 15,60);
final Ataque paralizador = Ataque("Grass", "Paralizador", 10,70);
final Ataque latigazo = Ataque("Grass", "Latigazo", 80,0);

//Electric
final Ataque impactrueno = Ataque("Electric", "Impactrueno", 40,30);
final Ataque voltioCruel = Ataque("Electric", "Voltio Cruel", 90,0);
final Ataque chispazo = Ataque("Electric", "Chispazo", 80,0);
final Ataque rayo = Ataque("Electric", "Rayo", 90,0);
final Ataque voltiocambio = Ataque("Electric", "Voltiocambio", 70,0);
final Ataque electrocanon = Ataque("Electric", "Electrocañón", 120,0);

//Water
final Ataque hidrobomba = Ataque("Water", "Hidrobomba", 110,0);
final Ataque surf = Ataque("Water", "Surf", 90,0);
final Ataque pistolaAgua = Ataque("Water", "Pistola Agua", 40,20);
final Ataque burbuja = Ataque("Water", "Burbuja", 40,10);
final Ataque acuaCola = Ataque("Water", "Acua Cola", 90,0);
final Ataque hidropulso = Ataque("Water", "Hidropulso", 60,5);
final Ataque rayoBurbuja = Ataque("Water", "Rayo Burbuja", 65,0);
final Ataque escaldar = Ataque("Water", "Escaldar", 80,0);


//Fire
final Ataque lanzallamas = Ataque("Fire", "Lanzallamas", 90,0);
final Ataque ascuas = Ataque("Fire", "Ascuas", 40,20);
final Ataque giroFuego = Ataque("Fire", "Giro Fuego", 35,30);
final Ataque nitrocarga = Ataque("Fire", "Nitrocarga", 50,5);
final Ataque llamarada = Ataque("Fire", "Llamarada", 110,0);
final Ataque colmilloIgneo = Ataque("Fire", "Colmillo Ígneo", 65,0);
final Ataque calcinacion = Ataque("Fire", "Calcinación", 60,5);

//Normal
final Ataque golpeNormal= Ataque("Normal","Golpe Normal",50,0);
final Ataque hiperRayo= Ataque("Normal","Hiper Rayo",150,0);
final Ataque cuerpoNormal= Ataque("Normal","Cuerpo Normal",70,0);
final Ataque ataqueRapido = Ataque("Normal", "Ataque Rápido", 40,5);
final Ataque placaje = Ataque("Normal", "Placaje", 40,5);
final Ataque hipercolmillo = Ataque("Normal", "Hipercolmillo", 80,0);
final Ataque golpeCuerpo = Ataque("Normal", "Golpe Cuerpo", 85,0);
final Ataque frustracion = Ataque("Normal", "Frustración", 60,0);

//pokemones
//Steel
final PokemonBatalla lairon = PokemonBatalla("Steel", "Lairon", 420, 50, [colaFerrea, garraMetal, cuerpoPesado]);
final PokemonBatalla aggron = PokemonBatalla("Steel", "Aggron", 360, 70, [cuerpoPesado, colaFerrea]);
final PokemonBatalla aron = PokemonBatalla("Steel", "Aron", 400,30, [cabezaDeHierro, garraMetal]);

//Dark
final PokemonBatalla zorua = PokemonBatalla("Dark", "Zorua", 390, 80, [finta, pulsoUmbrio, juegoSucio]);
final PokemonBatalla zweilous = PokemonBatalla("Dark", "Zweilous", 330, 60, [mordisco, pulsoUmbrio, tajoUmbrio]);
final PokemonBatalla zarude = PokemonBatalla("Dark", "Zarude", 350, 105, [mordisco, pulsoUmbrio, tajoUmbrio]);

//Dragon
final PokemonBatalla flygon = PokemonBatalla("Dragon", "Flygon", 440, 100, [colaDragon, garraDragon]);
final PokemonBatalla rayquaza = PokemonBatalla("Dragon", "Rayquaza", 380, 95, [colaDragon, enfado, vastoImpacto]);
final PokemonBatalla dragapult = PokemonBatalla("Dragon", "Dragapult", 430, 142, [vastoImpacto, enfado, colaDragon]); 


//Ghost
final PokemonBatalla gengar = PokemonBatalla("Ghost", "Gengar", 420, 110, [bolaSombra, puasToxicas]);
final PokemonBatalla aegislash = PokemonBatalla("Ghost", "Aegislash", 440, 60, [tajoUmbrio, sombraVil, escudoReal]);
final PokemonBatalla chandelure = PokemonBatalla("Ghost", "Chandelure", 425, 80, [fuegoFatuo, infortunio, rayoConfuso]);

//Rock
final PokemonBatalla tyranitar = PokemonBatalla("Rock", "Tyranitar", 370,  61, [rocaAfilada, triturar, danzaDragon]);
final PokemonBatalla golemRock = PokemonBatalla("Rock", "Golem", 440,45, [trampaRocas, explosion, avalancha]);
final PokemonBatalla rhyperior = PokemonBatalla("Rock", "Rhyperior", 460, 40, [romperrocas, cuernoTaladro, cabezazoRoca]);

//Bug
final PokemonBatalla scizor = PokemonBatalla("Bug", "Scizor", 330, 65, [idaYVuelta, punoBala, danzaEspada]);
final PokemonBatalla volcarona = PokemonBatalla("Bug", "Volcarona", 340, 100, [zumbido, danzaAleteo, vendavalB]);
final PokemonBatalla heracross = PokemonBatalla("Bug", "Heracross", 435, 85, [tijeraX, megacuerno, bocajarro]);

//Psycho
final PokemonBatalla alakazam = PokemonBatalla("Psycho", "Alakazam", 410, 120, [psiquico, confusion, psicoCorte]);
final PokemonBatalla mewtwo = PokemonBatalla("Psycho", "Mewtwo", 480,  130, [ondaMental, confusion, psicoCorte]);
final PokemonBatalla baltoy = PokemonBatalla("Psycho", "Baltoy", 390, 50, [confusion, psicorrayo, paranormal]);

//Flying
final PokemonBatalla staraptor = PokemonBatalla("Flying", "Staraptor", 430,  100, [tornado, ataqueAla, pajaroOsado]);
final PokemonBatalla yveltal = PokemonBatalla("Flying", "Yveltal", 370,  99, [alaMortifera, vendavalF, tornado]);
final PokemonBatalla pidgeot = PokemonBatalla("Flying", "Pidgeot", 440, 101, [aireAfilado, pajaroOsado, danzaPluma]);

//Ground
final PokemonBatalla diglett = PokemonBatalla("Ground", "Diglett", 380, 95, [bofetonLodo, disparoLodo, bombaFango]);
final PokemonBatalla golemGround = PokemonBatalla("Ground", "Golem", 440,  45, [terremoto, disparoLodo, bofetonLodo]);
final PokemonBatalla sandslash = PokemonBatalla("Ground", "Sandslash", 425, 65, [arenasArdientes, ataqueArena, terratemblor]);

//Poison
final PokemonBatalla ekans = PokemonBatalla("Poison", "Ekans", 390,  55, [picotazoVenenoso, deslumbrar, acido]);
final PokemonBatalla nidorina = PokemonBatalla("Poison", "Nidorina", 420, 56, [doblePatada, picotazoVenenoso, mordisco]);
final PokemonBatalla seviper = PokemonBatalla("Poison", "Seviper", 430, 65, [colaVeneno, niebla, colmilloVenenoso]);

//Fight
final PokemonBatalla mankey = PokemonBatalla("Fight", "Mankey", 400, 70, [patadaBaja, aranazo, golpesFuria]);
final PokemonBatalla machop = PokemonBatalla("Fight", "Machop", 410, 35, [golpeKarate, movimientoSismico, sumision]);
final PokemonBatalla hitmonlee = PokemonBatalla("Fight", "Hitmonlee", 420, 87, [doblePatada, patadaSalto, patadaGiro]);

//Ice
final PokemonBatalla jynx = PokemonBatalla("Ice", "Jynx", 410, 95, [punoHielo, besoAmoroso, dobleBofeton]);
final PokemonBatalla lapras = PokemonBatalla("Ice", "Lapras", 380, 60, [rayoHielo, canto, neblina]);
final PokemonBatalla dewgong = PokemonBatalla("Ice", "Dewgong", 350, 70, [rayoAurora, descanso, derribo]);

//Grass
final PokemonBatalla bulbasaur = PokemonBatalla("Grass", "Bulbasaur", 410, 45, [latigoCepa, drenadoras, hojaAfilada]);
final PokemonBatalla oddish = PokemonBatalla("Grass", "Oddish", 390, 30, [absorber, polvoVeneno, danzaPetalo]);
final PokemonBatalla tangela = PokemonBatalla("Grass", "Tangela", 420, 60, [constriccion, paralizador, latigazo]);

//Electric
final PokemonBatalla pikachu = PokemonBatalla("Electric", "Pikachu", 390, 90, [impactrueno, voltioCruel, chispazo]);
final PokemonBatalla magnemite = PokemonBatalla("Electric", "Magnemite", 380, 45, [impactrueno, chispazo, rayo]);
final PokemonBatalla jolteon = PokemonBatalla("Electric", "Jolteon", 430, 80, [voltiocambio, impactrueno, electrocanon]);

//Water
final PokemonBatalla squirtle = PokemonBatalla("Water", "Squirtle", 410,  43, [burbuja, acuaCola, hidropulso]);
final PokemonBatalla poliwhirl = PokemonBatalla("Water", "Poliwhirl", 420, 70, [burbuja, rayoBurbuja, escaldar]);
final PokemonBatalla vaporeon = PokemonBatalla("Water", "Vaporeon", 380,  65, [acuaCola, hidropulso, escaldar]);

//Fire
final PokemonBatalla charmander = PokemonBatalla("Fire", "Charmander", 390, 65, [ascuas, lanzallamas, nitrocarga]);
final PokemonBatalla arcanine = PokemonBatalla("Fire", "Arcanine", 460, 95, [lanzallamas, llamarada, colmilloIgneo]);
final PokemonBatalla rapidash = PokemonBatalla("Fire", "Rapidash", 440,105, [llamarada, nitrocarga, calcinacion]);

//Normal
final PokemonBatalla rattata = PokemonBatalla("Normal", "Rattata", 380, 72, [ataqueRapido, placaje, hipercolmillo]);
final PokemonBatalla meowth = PokemonBatalla("Normal", "Meowth", 390, 90, [aranazo, golpeCuerpo, frustracion]);
final PokemonBatalla evee = PokemonBatalla("Normal", "Eevee", 410, 55, [ataqueRapido, placaje, golpeCuerpo]);





// ITEMS 
final PocionSimple pocion = PocionSimple();
final SuperPocion superPocion = SuperPocion();
final Hiperpocion hiperPocion = Hiperpocion();
final Antidoto antidoto = Antidoto();
final Antiquemar antiquemar = Antiquemar();
final Despertar despertar = Despertar();
final Antiparalisis antiparalisis = Antiparalisis();


final List<PokemonBatalla> pokedexGlobal = [
  lairon, aggron, aron,
  zorua, zweilous, zarude,
  flygon, rayquaza, dragapult,
  gengar, aegislash, chandelure,
  tyranitar, golemRock, rhyperior,
  scizor, volcarona, heracross,
  alakazam, mewtwo, baltoy,
  staraptor, yveltal, pidgeot,
  diglett, golemGround, sandslash,
  ekans, nidorina, seviper,
  mankey, machop, hitmonlee,
  jynx, lapras, dewgong,
  bulbasaur, oddish, tangela,
  pikachu, magnemite, jolteon,
  squirtle, poliwhirl, vaporeon,
  charmander, arcanine, rapidash,
  rattata, meowth, evee
];
