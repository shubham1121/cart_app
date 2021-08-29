import 'package:first_app/models/catalog.dart';
import 'package:flutter/widgets.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  final List<int> _itemIDs=[];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog=newCatalog;
  }
  List<Item> get items => _itemIDs.map((id) => _catalog.getItemById(id)).toList();

  num get totalPrice => items.fold(0, (totalPrice, current) => totalPrice+current.price);

  void add(Item item)
  { print(_itemIDs.length);
    _itemIDs.add(item.id);
    notifyListeners();
  }

  void remove(Item item)
  {
    _itemIDs.remove(item.id);
    notifyListeners();
  }
}