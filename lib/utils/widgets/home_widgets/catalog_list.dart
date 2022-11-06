import 'package:flutter/material.dart';
import 'package:go/pages/home_details_page.dart';
// import 'package:go/utils/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/catalog.dart';
import '../../../pages/card.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.item.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.item[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              )),
          // child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  // const CatalogItem({Key? key, @required this.catalog) : assert(catalog != null), super(key: key);
  final item = catalog;

  get image => null;

  static get catalog => null;
  @override
  Widget build(BuildContext context) {
    var catalog;
    var image2 = null;
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image,
            catalog.image,
            image: image2,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                addtocard(catalog: catalog)
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class addtocard extends StatefulWidget {
  final Item = catalog;
  const addtocard({
    Key? key,
    required catalog,
  }) : super(key: key);

  get catalog => null;

  @override
  State<addtocard> createState() => _addtocardState();
}

class _addtocardState extends State<addtocard> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
