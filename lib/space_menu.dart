import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:spacegame/widgets/main_game.dart';
import 'package:spacegame/Score/ui/main_score.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/User/ui/main_user.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/game/bloc/bloc_game.dart';
import 'game/main_game.dart';

class SpaceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //Construyo un NavigationBar al estilo IOs
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.indigo,
            backgroundColor: Color(0x33FFFFFF),
            inactiveColor: Colors.white30,
            items: [
              //Añado items a mi NavigationBar
              BottomNavigationBarItem(
                  icon: Icon(Icons.gamepad),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("")
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context){
                  //Indico que usare un bloc generico
                  return BlocProvider(
                      child: GameMain(),
                      //Indico que bloc usare
                      bloc: GameBloc()
                  );
                },
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context){
                  //Indico que usare un bloc generico
                  return BlocProvider<UserBloc>(
                    //Indico que bloc usare
                    bloc: UserBloc(),
                    child: ScoreMain(),
                  );
                },
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  //Indico que usare un bloc generico
                  return BlocProvider<UserBloc>(
                    //Indico que bloc usare
                    bloc: UserBloc(),
                    child: UserMain(),
                  );
                },
              );
              break;

          }

        },
      ),
    );
  }

}