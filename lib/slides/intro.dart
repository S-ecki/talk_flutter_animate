import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
            header: FlutterDeckHeaderConfiguration(
              title: 'flutter_animate',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title:
          'A performant library that makes it simple to add almost any kind of animated effect in Flutter.',
    );
  }
}

class QuestionSlide extends FlutterDeckSlideWidget {
  const QuestionSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/question',
            header: FlutterDeckHeaderConfiguration(
              title: 'Hands Up! 🔫',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'How many of you have heard of/used flutter_animate before? 🤔',
    );
  }
}
