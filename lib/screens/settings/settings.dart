import 'package:flutter/material.dart';
import 'package:my_app/store/index.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    void handleLogout() {
      appState.setIsLogin(false);
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
        child: Center(
            child: ElevatedButton(
          onPressed: handleLogout,
          child: Text('Logout'),
        )),
      ),
    );
  }
}
