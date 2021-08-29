import 'package:first_app/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<CartModel>(
                  builder:(context,myCart,child)=> _CartList(cart: myCart)),
              ),
            ),
            Divider(),
            Consumer<CartModel>(
              builder: (context,myCart,child)=> _CartTotal(cart: myCart,)),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel cart;

  const _CartTotal({Key? key, required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '\$${cart.totalPrice}',
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
            width: 100,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buying Not Supported Yet!'),
                  ),
                );
              },
              child: Text(
                'Buy',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).buttonColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel cart;

  const _CartList({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartModel>(context); // created a cartProvider to call the CartModel functions
    return cart.items.isEmpty?Center(child: Text('Nothing Here!',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)) : ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text('${cart.items[index].name}'),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            cartProvider.remove(cart.items[index]); // Fix
          },
        ),
      ),
    );
  }
}
