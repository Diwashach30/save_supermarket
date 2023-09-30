import 'package:flutter/material.dart';

import 'package:save_supermarket/models/products.dart';
import 'package:save_supermarket/pages/home_detail_page.dart';
import 'package:save_supermarket/widgets/home_widgets/product_image.dart';
import 'package:save_supermarket/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.items.length,
      itemBuilder: (context, index) {
        final product = ProductModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                key: ValueKey(product),
                product: product,
              ),
            ),
          ),
          child: ProductItem(product: product),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Item product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(
              image: product.image,
            ),
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
                  "Rs ${product.price}".text.bold.size(4).make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(),
                        )),
                    child: "Order".text.size(2).make(),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
