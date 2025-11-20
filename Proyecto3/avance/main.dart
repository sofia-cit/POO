import 'dart:io';

//Interfaz
abstract class Combate{
 void atacar();
 void mostrarAtaque();
}

//Clase Abstracta Padre (Pokemon)
abstract class Pokemon implements Combate{
  String _tipo;
  String _nombre;
  double _vida;
  int _nivel;

  Pokemon(this._tipo, this._nombre, this._vida, this._nivel);

  @override
  void atacar();

  @override
  void mostrarAtaque();

}

//Clase Atque
class Ataque{
  String _tipoAtaque;
  String _nombreAtaque;
  int _danio;
  double _efectivo = 1.0;
  int calcularDanio(){
    int _danioFinal = (_efectivo *_danio).toInt();
    return _danioFinal;
  } 
 
  Ataque(this._tipoAtaque, this._nombreAtaque, this._danio);

}

//Efectividad del Atque
class Efectividad {
  double calcularEfectividad(String _tipoAtaque, String _tipoEnemigo) {
    double _efectivo = 1.0;

    //Fuego
    if (_tipoAtaque == "Fuego" && _tipoEnemigo == "Planta") {
      _efectivo = 2.0;
    } else if (_tipoAtaque == "Fuego" && _tipoEnemigo == "Agua") {
      _efectivo = 0.5;
    } else if (_tipoAtaque == "Fuego" && _tipoEnemigo == "Fuego") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Fuego" && _tipoEnemigo == "Electrico") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Fuego" && _tipoEnemigo == "Psiquico") {
      _efectivo = 1.0;
    }

    //Agua
    else if (_tipoAtaque == "Agua" && _tipoEnemigo == "Fuego") {
      _efectivo = 2.0;
    } else if (_tipoAtaque == "Agua" && _tipoEnemigo == "Planta") {
      _efectivo = 0.5;
    } else if (_tipoAtaque == "Agua" && _tipoEnemigo == "Agua") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Agua" && _tipoEnemigo == "Electrico") {
      _efectivo = 0.5;
    } else if (_tipoAtaque == "Agua" && _tipoEnemigo == "Psiquico") {
      _efectivo = 1.0;
    }

    //Planta
    else if (_tipoAtaque == "Planta" && _tipoEnemigo == "Agua") {
      _efectivo = 2.0;
    } else if (_tipoAtaque == "Planta" && _tipoEnemigo == "Fuego") {
      _efectivo = 0.5;
    } else if (_tipoAtaque == "Planta" && _tipoEnemigo == "Planta") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Planta" && _tipoEnemigo == "Electrico") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Planta" && _tipoEnemigo == "Psiquico") {
      _efectivo = 1.0;
    }

    //Electrico
    else if (_tipoAtaque == "Electrico" && _tipoEnemigo == "Agua") {
      _efectivo = 2.0;
    } else if (_tipoAtaque == "Electrico" && _tipoEnemigo == "Planta") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Electrico" && _tipoEnemigo == "Electrico") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Electrico" && _tipoEnemigo == "Fuego") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Electrico" && _tipoEnemigo == "Psiquico") {
      _efectivo = 1.0;
    }

    //Psiquico
    else if (_tipoAtaque == "Psiquico" && _tipoEnemigo == "Planta") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Psiquico" && _tipoEnemigo == "Agua") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Psiquico" && _tipoEnemigo == "Fuego") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Psiquico" && _tipoEnemigo == "Electrico") {
      _efectivo = 1.0;
    } else if (_tipoAtaque == "Psiquico" && _tipoEnemigo == "Psiquico") {
      _efectivo = 1.0;
    }

    return _efectivo;
  }
}

//Items

abstract class Item{
  String _nombreItem;
  String _tipoItem;
  int _cantidad;
  String _efecto;
  
  void usarItem();
  void mostrarEfecto();
  
  Item(this._nombreItem, this._tipoItem, this._cantidad, this._efecto);

}
