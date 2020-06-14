import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/widgets/main_game.dart';
import 'package:spacegame/Score/ui/main_score.dart';
import 'package:spacegame/User/ui/main_user.dart';

class SpaceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.indigo,
            backgroundColor: Color(0x33FFFFFF),
            inactiveColor: Colors.white30,
            items: [
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
                builder: (BuildContext context) => GameMain(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => ScoreMain(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => UserMain(),
              );
              break;

          }

        },
      ),
    );
  }

}