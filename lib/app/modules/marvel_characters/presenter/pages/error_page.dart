import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/marvel_characters_text.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  MarvelCharactersText text = MarvelCharactersText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.asset('assets/images/deadpoolOps.png'),
            ),
            const SizedBox(height: 40),
            Text(
              text.ops,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              text.tryAgain,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
