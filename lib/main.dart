import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/app/app.dart';
import 'package:flutter_crypto_test/app/injection.dart' as di;

void main() async {
  await di.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Test',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          primary: Colors.green,
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}
