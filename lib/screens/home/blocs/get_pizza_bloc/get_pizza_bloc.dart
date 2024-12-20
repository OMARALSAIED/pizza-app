import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  PizzaRepo _pizzaRepo;
  GetPizzaBloc(this._pizzaRepo) : super(GetPizzaInitial()) {
    on<GetPizza>((event, emit) async {
      emit(GetPizzaLoading());
      try {
        List<Pizza> pizza = await _pizzaRepo.getPizzas();
        emit(GetPizzaSccess(pizza));
      } catch (e) {
        emit(GetPizzFailuer());
      }
      // TODO: implement event handler
    });
  }
}
