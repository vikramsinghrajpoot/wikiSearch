import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikisearch/Screens/CommonViews/AppLoader.dart';
import 'package:wikisearch/Screens/Constants/Constants.dart';
import 'package:wikisearch/Screens/WikiSearch/Models/SearchResponse.dart';
import 'package:wikisearch/Screens/WikiSearch/SearchList/WikiSearchCell.dart';
import 'package:wikisearch/Screens/WikiSearch/SearchDetails/WikiSearchDetailPage.dart';

import '../Bloc/index.dart';

class WikiSearchList extends StatelessWidget {
  const WikiSearchList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Pages> data;
    return BlocConsumer(
      buildWhen: (context, state) {
        return !(state is WikiDetailsDoneState);
      },
      builder: (context, state) {
        if (state is WikiSearchDefaultState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search),
                Text(AppMessages.searchDesc.string()),
              ],
            ),
          );
        }
        if (state is WikiSearchLoadingState) {
          return AppLoader();
        }
        if (state is WikiSearchDoneState) {
          data = state.search;
        }

        if (state is WikiSearchErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return WikiSearchCell(
                page: data[index],
              );
            },
            itemCount: data.length,
          ),
        );
      },
      listener: (context, state) {
        if (state is WikiDetailsDoneState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WikiSearchDetailPage(
                        page: state.page,
                      )));
        }
      },
      bloc: BlocProvider.of<WikiSearchBloc>(context),
    );
  }
}
