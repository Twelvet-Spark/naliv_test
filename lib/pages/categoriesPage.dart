// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:naliv_test/api.dart';
import 'package:naliv_test/pages/tokenPage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List categories = [];

  Future<void> _fetchCategories() async {
    List categories0 = await fetchCategories();
    setState(() {
      categories = categories0;
    });
    print(categories0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Категории")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, index) {
            return Text(
              categories[index]['name'],
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          }
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TokenPage()),
            );
          },
          child: const Text("Обратно"),
        ),
      ),
    );
  }
}
