part of 'get_pizza_bloc.dart';

sealed class GetPizzaState extends Equatable {
  const GetPizzaState();

  @override
  List<Object> get props => [];
}
final class GetPizzaInitial extends GetPizzaState {}
final class GetPizzFailuer extends GetPizzaState {}

final class GetPizzaLoading extends GetPizzaState {}

final class GetPizzaSccess extends GetPizzaState {
  final List<Pizza> pizza;
  const GetPizzaSccess(this.pizza);

  @override
  List<Object> get props => [pizza];
}
