import 'package:flutter/material.dart';

//Ventana de Inicio de Sesion
class ButtonSignIn extends StatefulWidget{

  final String text;
  double width = 0.0;
  double height = 0.0;
  VoidCallback onPressed;

  ButtonSignIn({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  State createState() {
    return _ButtonSignIn();
  }
}

class _ButtonSignIn extends State<ButtonSignIn>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFa7ff84),
              Color(0xFF1cbb78),
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0,0.6),
            stops: [0.0,0.6],
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Metal',
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}