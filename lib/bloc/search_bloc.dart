import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planets/constants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(Planets.values)) {
    on<SearchQuery>((SearchQuery event, Emitter<SearchState> emit) {
      List<Planets> searchedPlanets = [];

      for (var element in Planets.values) {
        if (element.toString().toLowerCase().contains(event.query)) {
          searchedPlanets.add(element);
        }
      }

      emit(SearchLoaded(searchedPlanets));
    });
  }
}
