import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ReferencesSlide extends FlutterDeckSlideWidget {
  const ReferencesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/resources',
            steps: 4,
            header: FlutterDeckHeaderConfiguration(
              title: 'Resources',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FlutterDeckBulletList(
                useSteps: true,
                items: const [
                  'pub.dev: The docs (😯)',
                  'Youtube: "flutter_animate (Package of the Week)"',
                  'Youtube: "Flutter Forward - Making UI Animation Easy & Fun"',
                  'GitHub: flutter-wonderous-app',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
