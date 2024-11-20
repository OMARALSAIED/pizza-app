import 'package:pizza_repository/pizza_repository.dart';

import 'models/models.dart';

abstract class PizzaRepo {
    Future<List<Pizza>> getPizzas();

}