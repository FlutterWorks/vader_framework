import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: FlutterLogo(size: 80),
      loadingIndicator: Container(
        width: 84,
        height: 84,
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
      onFinish: () => context.go('/EventList'),
    );
  }
}
