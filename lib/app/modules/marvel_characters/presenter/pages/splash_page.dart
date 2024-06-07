import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../controllers/home_page_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  HomePageController controller = Modular.get();
  Logger logger = Modular.get();
  final int comicId = 10583;
  final int offset = 5;

  @override
  void initState() {
    super.initState();
    logger.i('Splash Page foi iniciada.');
    controller.getCharactersByComicId(comicId, offset);
    controller.getCharacters(0);
    _navigateToNextPage();
  }

  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset('assets/images/splashPage.jpg', fit: BoxFit.fill));
  }
}
