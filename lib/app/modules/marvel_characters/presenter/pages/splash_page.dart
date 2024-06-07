import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:marvel_app/app/core/config/widget_status.dart';

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
  final int limit = 5;

  @override
  void initState() {
    super.initState();
    logger.i('Splash Page foi iniciada.');
    controller.getCharactersByComicId(comicId, offset, limit);
    controller.getCharacters(0);
    _navigateToNextPage();
  }

  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: 4), () {
      controller.appStatus == WidgetStatus.error
          ? Navigator.pushReplacementNamed(context, '/error')
          : Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset('assets/images/splashPage.jpg', fit: BoxFit.fill));
  }
}
