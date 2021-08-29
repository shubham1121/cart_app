import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final Item item;

  const ItemsWidget({Key? key, required this.item})  :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 2.0,
      child: ListTile(

        onTap: (){
          print(item.name);
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }
}
