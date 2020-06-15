import 'package:flame/components/animation_component.dart';
import 'alien.dart';
import 'game_background.dart';

class Explosion extends AnimationComponent {
  static const TIME = 0.75;

  Explosion(Alien dragon)
      : super.sequenced(ALIEN_SIZE, ALIEN_SIZE, 'explosion-4.png', 7,
            textureWidth: 31.0, textureHeight: 31.0) {
    this.x = dragon.x;
    this.y = dragon.y;
    this.animation.stepTime = TIME / 7;
  }

  bool destroy() {
    return this.animation.isLastFrame;
  }
}
