import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:wikisearch/Screens/Constants/Constants.dart';
import 'package:wikisearch/Screens/Services/ApiResponse.dart';
import 'package:wikisearch/Screens/Services/AppApi.dart';
import 'package:wikisearch/Screens/Util/CacheManager.dart';
import 'package:wikisearch/Screens/WikiSearch/Models/SearchResponse.dart';

import 'index.dart';

@immutable
abstract class WikiSearchEvent {
  Stream<WikiSearchState> applyAsync(
      {WikiSearchState currentState, WikiSearchBloc bloc});
}

class UnWikiSearchEvent extends WikiSearchEvent {
  @override
  Stream<WikiSearchState> applyAsync(
      {WikiSearchState currentState, WikiSearchBloc bloc}) async* {
    yield WikiSearchDefaultState();
  }
}

class LoadWikiSearchEvent extends WikiSearchEvent {
  final String text;
  LoadWikiSearchEvent({this.text});
  @override
  Stream<WikiSearchState> applyAsync(
      {WikiSearchState currentState, WikiSearchBloc bloc}) async* {
    try {
      yield WikiSearchLoadingState();
      if (CacheManager.shared.containData(text)) {
        yield WikiSearchDoneState(CacheManager().getData(text));
        return;
      }
      final ApiResponse response = await AppApi().getSearchfor(this.text);
      if (response.status == APIStatus.COMPLETED) {
        final modelResponse = SearchResponse.fromJson(response.data);
        if (modelResponse.error != null) {
          yield WikiSearchErrorState(modelResponse.error.info);
        } else if (modelResponse.query != null) {
          CacheManager.shared.cacheResponse(text, modelResponse.query?.pages);
          yield WikiSearchDoneState(modelResponse.query?.pages);
        } else {
          yield WikiSearchErrorState(AppMessages.noRecodFound.string());
        }
      } else {
        yield WikiSearchErrorState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWikiSearchEvent', error: _, stackTrace: stackTrace);
      yield WikiSearchErrorState(_?.toString());
    }
  }
}

class WikiSearchDetailsEvent extends WikiSearchEvent {
  final Pages page;
  WikiSearchDetailsEvent({this.page});
  @override
  Stream<WikiSearchState> applyAsync(
      {WikiSearchState currentState, WikiSearchBloc bloc}) async* {
    try {
      yield WikiDetailsDoneState(page);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadWikiSearchEvent', error: _, stackTrace: stackTrace);
      yield WikiSearchErrorState(_?.toString());
    }
  }
}
