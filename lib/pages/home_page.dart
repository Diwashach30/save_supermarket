import 'package:flutter/material.dart';
import 'package:save_supermarket/models/products.dart';
import 'package:save_supermarket/widgets/drawer.dart';
import 'package:save_supermarket/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => ProductModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Supermarket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
