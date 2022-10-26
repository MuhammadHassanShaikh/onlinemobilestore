import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final item = catalog;
  HomeDetailPage({Key? key}) : super(key: key);

  static get catalog => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Buy".text.make(),
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Diam kasd lorem lorem magna ea. Ipsum et dolore sit amet sit sed. Amet et et consetetur dolores diam consetetur sea sed, dolore duo amet sed accusam magna et clita amet, accusam et diam magna ea eirmod est sanctus, dolor sed duo sanctus tempor sed et eirmod, sit consetetur kasd."
                        .text
                        .textStyle(context.captionStyle)
                        .make(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
