import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikisearch/Screens/CommonViews/AppSearchBar.dart';
import 'package:wikisearch/Screens/Constants/Constants.dart';
import 'package:wikisearch/Screens/WikiSearch/Bloc/WikiSearch_bloc.dart';
import 'package:wikisearch/Screens/WikiSearch/SearchList/WikiSearchList.dart';
import '../Bloc/index.dart';

class WikiSearchPage extends StatefulWidget {
  const WikiSearchPage({Key key}) : super(key: key);

  @override
  _WikiSearchPageState createState() => _WikiSearchPageState();
}

class _WikiSearchPageState extends State<WikiSearchPage> {
  TextEditingController _searchController;
  Timer _debounce;
  WikiSearchBloc _bloc;
  @override
  void initState() {
    _bloc = WikiSearchBloc();
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppMessages.wikiSearch.string()),
        ),
        body: BlocProvider(
          create: (context) => _bloc,
          child: Column(
            children: <Widget>[
              AppSearchBar(
                controller: _searchController,
                hintText: AppMessages.searchHint.string(),
                onChange: this._textDidChange,
              ),
              Expanded(child: WikiSearchList()),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _textDidChange(value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _bloc.add(LoadWikiSearchEvent(text: value));
    });
  }
}
