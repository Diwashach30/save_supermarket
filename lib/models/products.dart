class ProductModel {
  static final items = [
    Item(
        id: "surf",
        name: "Tide",
        desc: "Best Detergent Powder",
        price: "185",
        color: "#33505a",
        image:
            "https://rukminim2.flixcart.com/image/850/1000/jxjahe80/washing-powder/y/k/d/5-plus-jasmine-rose-tide-original-imafhzfaysmhfmcb.jpeg?q=20")
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final String price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
