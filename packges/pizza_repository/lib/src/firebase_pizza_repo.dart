
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pizza_repository.dart';


class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzaes');


  
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then((value) => value.docs
          .map((e) => Pizza.fromEntity(PizzaEntity.fromJson(e.data())))
          .toList());
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }
  
  
 
  
}
