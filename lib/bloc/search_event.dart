part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchQuery extends SearchEvent {
  SearchQuery(this.query);

  final String query;
}