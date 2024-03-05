import 'package:flutter/material.dart';
import 'package:naliv_test/api.dart';
import 'package:naliv_test/pages/categoriesPage.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final tokenController = TextEditingController();

  String? token = "";

  Future<void> _getToken() async {
    token = await getToken();
    token ??= "";
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Введите токен",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 500,
                child: TextField(
                  controller: tokenController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Токен',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (token!.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryPage()),
                      );
                    } else if (tokenController.text.isEmpty && token!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Токен не может быть пустым")),
                      );
                    } else {
                      setToken(tokenController.text.trim());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryPage()),
                      );
                    }
                  },
                  child: const Text("Продолжить"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
