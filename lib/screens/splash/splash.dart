import 'package:flutter/material.dart';
import 'package:my_app/store/index.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // AppState appState = AppState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    if (appState.initialized) {
      Future.delayed(Duration(seconds: 2), () {
        appState.initialApp();
      });
    }

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-auth.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Text('Splash Screen 111'),
        ));
  }
}
