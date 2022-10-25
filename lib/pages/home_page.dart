import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go/models/catalog.dart';
import 'package:go/utils/widgets/items_widget.dart';
import 'package:go/utils/widgets/themes.dart';
import '../utils/widgets/drawer.dart';
// import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Hassan";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["Products"];
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(
      20,
      (index) => CatalogModel.items[0],
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList()
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        "catalog app".text.xl5.bold.make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  // const CatalogItem({Key? key, @required this.catalog) : assert(catalog != null), super(key: key);
  final item = catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image catalog.image
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: (){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(),
                shape:MaterialStateProperty.all(StadiumBorder(),) 
                ),
                 child: "Buy".text.make(),)
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
//5:11

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key @required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image);

  }
}

//new@pass123