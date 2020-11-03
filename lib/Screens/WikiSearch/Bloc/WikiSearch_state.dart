import 'package:equatable/equatable.dart';
import 'package:wikisearch/Screens/WikiSearch/Models/SearchResponse.dart';

abstract class WikiSearchState extends Equatable {
  final List propss;
  WikiSearchState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class WikiSearchDefaultState extends WikiSearchState {
  WikiSearchDefaultState();

  @override
  String toString() => 'WikiSearchDefaultState';
}

/// Initialized
class WikiSearchLoadingState extends WikiSearchState {
  WikiSearchLoadingState() : super([]);

  @override
  String toString() => 'WikiSearchLoadingState';
}

class WikiSearchDoneState extends WikiSearchState {
  final List<Pages> search;

  WikiSearchDoneState(this.search) : super([search]);

  @override
  String toString() => 'WikiSearchDoneState $search';
}

class WikiDetailsDoneState extends WikiSearchState {
  final Pages page;
  WikiDetailsDoneState(this.page) : super([page]);
  @override
  String toString() => 'WikiSearchDoneState $page';
}

class WikiSearchErrorState extends WikiSearchState {
  final String errorMessage;

  WikiSearchErrorState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'WikiSearchErrorState';
}
