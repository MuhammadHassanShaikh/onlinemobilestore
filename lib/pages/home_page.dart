import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go/models/catalog.dart';
import 'package:go/utils/routes.dart';
import 'package:http/http.dart' as http ;
// import 'package:go/utils/widgets/items_widget.dart';
// import 'package:go/utils/widgets/themes.dart';
// import '../utils/widgets/drawer.dart';
// import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import '../utils/widgets/home_widgets/catalog_header.dart';
import '../utils/widgets/home_widgets/catalog_list.dart';
// import 'home_widgets/catalog_header.dart';
// import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Hassan";
  final url = "";// add link here
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // final catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["Products"];
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(
      20,
      (index) => CatalogModel.item[0],
    );
    return Scaffold(
      final _cart = (VxState.store as MyStore).cart;
      backgroundColor: context.canvasColor,
      floatingActionButton: Vx.builder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) =>
          FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ).body: (color: Vx.red500, size: 22 , count: _cart.items.lenght, textStyle: TextStyle(color: Colors.black,)),
    ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CatalogHeader(),
              if (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}



//5:28 hero animation


//new@pass123