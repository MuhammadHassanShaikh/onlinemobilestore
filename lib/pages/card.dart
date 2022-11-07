import 'package:go/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final int item;

  AddMutation(this.item);
  @override
  perform() {
    perform() {
      store.cart._itemIds.add(item.id);
    }
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final int item;

  RemoveMutation(this.item);
  @override
  perform() {
    perform() {
      store.cart._itemIds.remove(item.id);
    }
  }
}
