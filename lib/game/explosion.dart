import 'package:flame/components/animation_component.dart';
import 'model/alien.dart';
import 'ui/game_background.dart';

class Explosion extends AnimationComponent {
  static const TIME = 0.75;

  Explosion(Alien alien)
      : super.sequenced(ALIEN_SIZE, ALIEN_SIZE, 'explosion-4.png', 7,
            textureWidth: 31.0, textureHeight: 31.0) {
    this.x = alien.x;
    this.y = alien.y;
    this.animation.stepTime = TIME / 7;
  }

  bool destroy() {
    return this.animation.isLastFrame;
  }
}
