import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                child: Image.network(
                  catalog.imageUrl,
                  height: 300,
                ),
                tag: Key(
                  catalog.id.toString(),
                ),
              ),
            ),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 32,
                child: Container(
                  width: context.screenWidth,
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus ante eu euismod porta. Nunc tempor faucibus eros quis tempor. Phasellus aliquam leo id magna pulvinar mattis. In placerat metus aliquet scelerisque fringilla. Cras non urna tincidunt.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(32),
          color: Theme.of(context).cardColor,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${catalog.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Buy',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).buttonColor),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
              ).wh(100, 50),
            ],
          ),
        ),
      ),
    );
  }
}
