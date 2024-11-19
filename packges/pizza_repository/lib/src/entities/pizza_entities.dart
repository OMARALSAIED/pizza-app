import 'package:pizza_repository/src/entities/macros_entity.dart';
import 'package:pizza_repository/src/models/models.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  double price;
  double discount;
  List<Macros> macros;

  PizzaEntity(
      {required this.pizzaId,
      required this.picture,
      required this.isVeg,
      required this.spicy,
      required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.macros});

  Map<String, Object> toJson() {
    return {
      "pizzaId": pizzaId,
      "picture": picture,
      "isVeg": isVeg,
      "spicy": spicy,
      "name": name,
      "desc": description,
      "price": price,
      "discount": discount,
      "macros": macros.map((macro)=>macro.toEntity().toJson())
    };
  }

  static PizzaEntity fromJson(Map<String, dynamic> doc) {
    return PizzaEntity(
        pizzaId: doc['pizzaId'],
        picture: doc['picture'],
        isVeg: doc['isVeg'],
        spicy: doc['spicy'],
        name: doc['name'],
        description: doc['description'],
        price: doc['price'],
        discount: doc['discount'],
        macros: doc['macros'].map((e)=>Macros.fromEntity(MacrosEntity.fromJson(e))));
  }
}
