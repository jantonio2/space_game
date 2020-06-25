import 'package:flutter/material.dart';
import 'game_background.dart';

class CardLevel extends StatefulWidget{

  List<String> img;
  String level;

  CardLevel(this.img, this.level);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardLevel(img, level);
  }
}

class _CardLevel extends State<CardLevel>{

  List<String> img;
  String level;

  int index=0;

  _CardLevel(this.img, this.level);


//GlobalKey<ScaffoldState> _sacaffolkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      height: 150,
      width: 150,
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      //color: Colors.indigo,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584CD1)
              ],
              begin: FractionalOffset(0.2,0.0),
              end: FractionalOffset(1.0,0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          ),
          //color: Colors.indigo,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0x33053E67),
                blurRadius: 15.0,
                offset: Offset(0.0,7.0)
            )
          ]
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  right: 20.0
              ),
              width: 80.0,
              height: 80.0,

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(img[index]),
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: 20.0
              ),
              child:  Text(
                level,
                style: TextStyle(
                    fontFamily: "Metal",
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                ),
                //textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: (){
                //var a = await GameBackground();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GameBackground(level)),ModalRoute.withName("/")
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                    right: 20.0
                ),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF4268D3),
                        Color(0xFF584CD1)
                      ],
                      begin: FractionalOffset(0.2,0.0),
                      end: FractionalOffset(1.0,0.6),
                      stops: [0.0,0.6],
                      tileMode: TileMode.clamp
                  ),
                ),

                child: Center(
                  child: Text(
                    'Jugar',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Metal",
                        color: Colors.white
                    ),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

  moverImagen() async{
    await Future.delayed(Duration(milliseconds: 150));
    setState(() {
      if(index == img.length-1){
        index = 0;
      }else{
        index++;
      }
    });
    moverImagen();
  }

  @override
  void initState() {
    moverImagen();
  }

}