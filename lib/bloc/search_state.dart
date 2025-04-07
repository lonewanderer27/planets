part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {
  SearchInitial(this.planets);

  final List<Planets> planets;
}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  SearchLoaded(this.planets);

  final List<Planets> planets;
}