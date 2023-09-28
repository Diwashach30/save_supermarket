// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:save_supermarket/models/products.dart';
import 'package:save_supermarket/widgets/themes.dart';
//import 'package:save_supermarket/widgets/drawer.dart';
// import 'package:save_supermarket/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    ProductModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductHeader(),
                  if (ProductModel.items.isNotEmpty)
                    ProductList().expand()
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              )),
        ));
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Save Supermaket".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
        "Gadgets Products"
            .text
            .xl
            .semiBold
            .color(MyTheme.darkBluishColor)
            .make()
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProductModel.items.length,
        itemBuilder: (context, index) {
          final product = ProductModel.items[index];
          return ProductItem(product: product);
        });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Item product;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          ProductImage(
            image: product.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              product.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              product.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\Rs ${product.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(
          context,
        );
  }
}
