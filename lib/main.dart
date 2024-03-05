import 'package:flutter/material.dart';
import 'package:naliv_test/api.dart';
import 'package:naliv_test/pages/categoriesPage.dart';
import 'package:naliv_test/pages/tokenPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
  print(getToken());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naliv Test',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (getToken().toString().isEmpty) {
      return const TokenPage();
    } else {
      return const CategoryPage();
    }
  }
}
