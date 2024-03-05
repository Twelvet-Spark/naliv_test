// ignore_for_file: unnecessary_null_comparison

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

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  String? token = "";

  Future<void> _getToken() async {
    token = await getToken();
    token ??= "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
      clearToken();
      if (token!.isEmpty) {
        return const TokenPage();
      } else {
        return const CategoryPage();
      }
    }
}
