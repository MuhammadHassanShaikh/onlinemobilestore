import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/catalog.dart';
import '../../../pages/card.dart';

class addtocard extends StatelessWidget {
  final Item = catalog;

  addtocard({
    Key? key,
    required catalog,
  }) : super(key: key);

  get catalog => null;

  static get catalog => null;

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
