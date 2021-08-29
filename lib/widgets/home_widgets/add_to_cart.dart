import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddToCart extends StatelessWidget {
  final Item catalog;
  final CartModel cart;
  AddToCart({Key? key,required this.catalog, required this.cart}) : super(key: key);
  final _catalog = CatalogModel();

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartModel>(context); // created a cartProvider to call the CartModel functions
    bool isInCart = cart.items.contains(catalog) ?  true:false;
    return ElevatedButton(
        onPressed: () {
          print("isInCart:$isInCart");
          if(!isInCart) {
            isInCart = !isInCart;
            cartProvider.add(catalog); // Fixed
            cart.catalog = _catalog;
            print(cart.items.length);
          }
        },
        child: isInCart ? Icon(Icons.done) : Icon(Icons.add),
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
        ),
      );
  }
}