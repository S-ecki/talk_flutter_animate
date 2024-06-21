import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:package_of_the_month/main.dart';

class ExampleBasicSlide extends FlutterDeckSlideWidget {
  const ExampleBasicSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/examplebasic',
            header: FlutterDeckHeaderConfiguration(
              title: 'Basic Syntax',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: splitTheme(context),
      leftBuilder: (context) {
        return const Column(
          children: [
            Spacer(),
            Text('Widget Syntax:'),
            FlutterDeckCodeHighlight(
              code: '''
Animate(
  effects: [FadeEffect(), ScaleEffect()],
  child: kFlutterLogo,
)''',
            ),
            Spacer(),
            Text('Extension Syntax:'),
            FlutterDeckCodeHighlight(
              code: '''
kFlutterLogo
  .animate()
  .fade()
  .scale()''',
            ),
            Spacer(),
          ],
        );
      },
      rightBuilder: (context) {
        return Center(
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            delay: 1.seconds,
            child: kFlutterLogo,
          ),
        );
      },
    );
  }
}
