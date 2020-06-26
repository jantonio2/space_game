import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class GameBloc implements Bloc{

  int puntos = 0;

  StreamController<int> _output = StreamController();

  //Funcion que devuelve los puntos
  Stream<int> get puntosStream => _output.stream;

  //Funcion para añadir los puntos segun el alien
  void sumaPunto(String nom){
    if(nom == 'extraterrestre4.png'){
      puntos += 100;
    }
    if(nom == 'alienrojo.png'){
      puntos +=150;
    }
    if(nom == 'alienpurple.png'){
      puntos +=200;
    }
    if(nom == 'aliensky.png'){
      puntos +=250;
    }
    if(nom == 'alieneye.png'){
      puntos +=300;
    }
    _output.add(puntos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}