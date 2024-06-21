import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:package_of_the_month/main.dart';

class ExampleListSlide extends FlutterDeckSlideWidget {
  const ExampleListSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/examplelist',
            header: FlutterDeckHeaderConfiguration(
              title: 'Animating Lists',
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
            FlutterDeckCodeHighlight(
              code: '''
 Column(
  children: [...]
    .animate(interval: 500.ms)
    .fadeIn()
    .shakeX()''',
            ),
            Spacer(),
          ],
        );
      },
      rightBuilder: (context) {
        return Center(
          child: Column(
            children: [
              'Hello',
              'dear',
              'Flutter',
              'Vienna',
              'Meetup',
              'people,',
              "let's",
              'go',
              'crazy',
              'now!',
            ]
                .map(
                  (text) => Text(
                    text,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
                .toList()
                .animate(interval: 500.ms)
                .fadeIn()
                .shakeX(),
          ),
        );
      },
    );
  }
}
