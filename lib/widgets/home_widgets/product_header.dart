import 'package:flutter/material.dart';
import 'package:save_supermarket/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
