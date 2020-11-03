import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class WikiSearchBloc extends Bloc<WikiSearchEvent, WikiSearchState> {
  WikiSearchBloc() : super();

  @override
  Stream<WikiSearchState> mapEventToState(
    WikiSearchEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'WikiSearchBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  WikiSearchState get initialState => WikiSearchDefaultState();
}
