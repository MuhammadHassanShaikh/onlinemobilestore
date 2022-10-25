import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go/models/catalog.dart';
import 'package:go/utils/widgets/items_widget.dart';
import 'package:go/utils/widgets/themes.dart';
import '../utils/widgets/drawer.dart';
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
                CatalogList().expand()
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