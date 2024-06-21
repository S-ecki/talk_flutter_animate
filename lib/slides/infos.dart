import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class InfoSlide extends FlutterDeckSlideWidget {
  const InfoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/infos',
            title: 'Infos',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Column(
        children: [
          Text(
            'Lots of amazing prebuilt effects',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FlutterDeckBulletList(
                    items: const [
                      'AlignEffect',
                      'BlurEffect',
                      'BoxShadowEffect',
                      'CallbackEffect',
                      'ColorEffect',
                      'CrossfadeEffect',
                      'CustomEffect',
                      'ElevationEffect',
                      'FadeEffect',
                      'FlipEffect',
                      'FollowPathEffect',
                      'ListenEffect',
                    ],
                  ),
                ),
                Expanded(
                  child: FlutterDeckBulletList(
                    items: const [
                      'MoveEffect',
                      'RotateEffect',
                      'SaturateEffect',
                      'ScaleEffect',
                      'ShaderEffect',
                      'ShakeEffect',
                      'ShimmerEffect',
                      'SlideEffect',
                      'SwapEffect',
                      'TintEffect',
                      'ToggleEffect',
                      'VisibilityEffect',
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
