import 'dart:ui';

import 'package:flame/components/component.dart';

const SPEED = 120.0;
const ExtraSize = 40.0;
class Extraterrestre extends SpriteComponent{

  Size dimensions;
  Extraterrestre(this.dimensions) : super.square(ExtraSize, 'extraterrestre1.png');
  double maxY;
  bool remove = false;

  @override
  void update(double t) {
    y += t * SPEED;
  }

  @override
  bool destroy() {
    return remove;
  }

  @override
  void resize(Size size) {
    this.x = size.width / 2;
    this.y = 0;
    this.maxY = size.height;
  }


}