import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:package_of_the_month/main.dart';

class ExampleCrazySlide extends FlutterDeckSlideWidget {
  const ExampleCrazySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            steps: 2,
            route: '/examplecrazy',
            header: FlutterDeckHeaderConfiguration(
              title: "Let's go crazy",
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: splitTheme(context),
      splitRatio: const SplitSlideRatio(left: 3, right: 2),
      leftBuilder: (context) {
        return FlutterDeckSlideStepsBuilder(
          builder: (context, stepNumber) {
            return stepNumber == 1
                ? const Center(
                    child: FlutterDeckCodeHighlight(
                      code: easyNavigationCode,
                    ),
                  )
                : const SingleChildScrollView(
                    child: FlutterDeckCodeHighlight(
                      code: nativeAnimationCode,
                    ),
                  );
          },
        );
      },
      rightBuilder: (context) {
        return Center(
          child: FractionallySizedBox(
            heightFactor: 0.7,
            widthFactor: 0.7,
            child: face
                .animate(
                  delay: 500.ms,
                  onComplete: (controller) => controller.repeat(reverse: true),
                )
                .shimmer(duration: 1.seconds)
                .scale(duration: 3.seconds, alignment: Alignment.bottomRight)
                .then()
                .shake(delay: 1.seconds, curve: Curves.elasticInOut),
          ),
        );
      },
    );
  }

  static const easyNavigationCode = '''
  mustacheman
    .animate(
      delay: 500.ms,
      onComplete: (controller) => controller.repeat(reverse: true),
    )
    .shimmer(duration: 1.seconds)
    .scale(duration: 3.seconds, alignment: Alignment.bottomRight)
    .then()
    .shake(delay: 1.seconds, curve: Curves.elasticInOut)''';

  static const nativeAnimationCode = '''
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlutterLogoAnimation extends StatefulWidget {
  const FlutterLogoAnimation({super.key});

  @override
  _FlutterLogoAnimationState createState() => _FlutterLogoAnimationState();
}

class _FlutterLogoAnimationState extends State<FlutterLogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500), // Total animation time
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(1.0, 3.0), // Scale from 1s to 3s
      ),
    );

    _shakeAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.05, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(3.0, 3.5,
            curve: Curves.elasticInOut), // Shake from 3s to 3.5s
      ),
    );

    // Start animations after a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true); // Repeat with reverse
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          // For shake
          offset: _shakeAnimation.value,
          child: Transform.scale(
            // For scaling
            scale: _scaleAnimation.value,
            alignment: Alignment.bottomRight,
            child: Shimmer.fromColors(
              // For shimmer effect
              baseColor: Colors.blue,
              highlightColor: Colors.lightBlue,
              child: kFlutterLogo,
            ),
          ),
        );
      },
    );
  }
}''';
}
