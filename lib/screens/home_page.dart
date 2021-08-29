import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/home_widgets/catalog_header.dart';
import 'package:first_app/widgets/home_widgets/catalog_list.dart';
import 'package:first_app/widgets/items_widget.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final jsonData = await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(jsonData);
    var itemData = decodedData["products"];
    CatalogModel.items =
        List.from(itemData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).buttonColor,
          onPressed: (){
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(Icons.add_shopping_cart,color: Colors.white,),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CatalogList(),
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}









