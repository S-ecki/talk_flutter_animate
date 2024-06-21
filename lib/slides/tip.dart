import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TipSlide extends FlutterDeckSlideWidget {
  const TipSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/tip',
            title: 'Tip',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Animate.restartOnHotReload = true;',
    );
  }
}
