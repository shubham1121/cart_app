import 'package:first_app/models/cart.dart';
import 'package:first_app/screens/home_detail_page.dart';
import 'package:first_app/widgets/catalog_image.dart';
import 'package:first_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/catalog.dart';
import 'package:provider/provider.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Hero(
              child: CatalogImage(
                image: catalog.imageUrl,
                width: 135.0,
                height: 135.0,
              ),
              tag: Key(
                catalog.id.toString(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ButtonBar(
                      buttonPadding: EdgeInsets.zero,
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${catalog.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Consumer<CartModel>(
                          builder: (context, myCart, child) =>
                              AddToCart(catalog: catalog),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        height: 150,
      ),
    );
  }
}
