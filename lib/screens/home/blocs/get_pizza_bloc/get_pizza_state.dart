part of 'get_pizza_bloc.dart';

sealed class GetPizzaState extends Equatable {
  const GetPizzaState();
  
  @override
  List<Object> get props => [];
}

final class GetPizzaInitial extends GetPizzaState {}
