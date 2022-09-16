class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
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

final products = [
  Item(id: "Hassan1",
   name: "iPhone 12 pro max",
    desc: "Apple IPhone 12 generation",
     price: 999, color: "#33505a", image:
     "https://previews.123rf.com/images/welcomia/welcomia1510/welcomia151000045/47332506-programming-work-time-programmer-typing-new-lines-of-html-code-laptop-and-hand-closeup-working-time-.jpg"
)
];