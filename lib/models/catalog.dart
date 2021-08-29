class CatalogModel{
 static List<Item> items=[];
 Item getItemById(int id) => items.firstWhere((element) => element.id==id , orElse: null);
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl});
  factory Item.fromMap(Map< String, dynamic >map)
  { return Item(
    id: map["id"],
    name: map["name"],
    desc: map["desc"],
    price: map["price"],
    color: map["color"],
    imageUrl: map["image"],
  );
  }
  toMap()=>{
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":imageUrl,
  };
}