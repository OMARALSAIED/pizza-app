import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
  GetPizzaBloc() : super(GetPizzaInitial()) {
    on<GetPizzaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
