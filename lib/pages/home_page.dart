import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go/models/catalog.dart';
import 'package:go/utils/widgets/items_widget.dart';
import '../utils/widgets/drawer.dart';
// import 'package:flutter/services.dart';
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
      appBar: AppBar(
        title: Text("Online Mobile Store App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: dummyList.length,
                itemBuilder: ((context, index) => ItemWidget(
                      item: dummyList[index],
                    )),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
// 4:33 hour time video