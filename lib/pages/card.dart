import 'package:http/http.dart';

import '../models/catalog.dart';

class CartModel {
  static final cartModel => cartModel._internal;
  CartModel._internal();

  factory CartModel() => _cartModel;

  //catalog field
  late CatalogModel _cartModel;
  //Collection of
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

