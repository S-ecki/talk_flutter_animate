import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:package_of_the_month/slides/basic.dart';
import 'package:package_of_the_month/slides/crazy.dart';
import 'package:package_of_the_month/slides/intro.dart';
import 'package:package_of_the_month/slides/lists.dart';
import 'package:package_of_the_month/slides/references.dart';
import 'package:package_of_the_month/slides/tip.dart';
import 'package:package_of_the_month/slides/title.dart';

const kFlutterLogo = FlutterLogo(size: 300);
final face = Image.asset('assets/face.png');
const bgColorDark = Color(0xFF16222A);
const bgColorLight = Color.fromARGB(255, 39, 66, 83);

void main() {
  Animate.restartOnHotReload = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(Color(0xFFB5FFFC)),
          dark: FlutterDeckBackground.gradient(
            LinearGradient(
              colors: [
                bgColorDark,
                bgColorLight,
              ],
            ),
          ),
        ),
        transition: FlutterDeckTransition.fade(),
        footer: FlutterDeckFooterConfiguration(
          widget: Text('Shoutout to flutter_deck! 💙'),
          showSlideNumbers: true,
        ),
      ),
      slides: const [
        TitleSlide(),
        QuestionSlide(),
        IntroSlide(),
        ExampleBasicSlide(),
        ExampleListSlide(),
        ExampleCrazySlide(),
        TipSlide(),
        ReferencesSlide(),
      ],
    );
  }
}

FlutterDeckThemeData? splitTheme(BuildContext context) =>
    FlutterDeckTheme.of(context).copyWith(
      splitSlideTheme: const FlutterDeckSplitSlideThemeData(
        leftBackgroundColor: bgColorDark,
        rightBackgroundColor: bgColorLight,
      ),
    );
