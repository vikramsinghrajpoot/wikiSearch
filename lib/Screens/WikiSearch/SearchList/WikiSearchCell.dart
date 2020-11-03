import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wikisearch/Screens/WikiSearch/Models/SearchResponse.dart';
import '../Bloc/index.dart';

class WikiSearchCell extends StatelessWidget {
  final Pages page;
  const WikiSearchCell({
    Key key,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<WikiSearchBloc>(context)
          .add(WikiSearchDetailsEvent(page: page)),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              page.thumbnail?.source != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        page.thumbnail.source,
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Icon(
                      Icons.photo_size_select_actual,
                      size: 60,
                    ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      page.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(page.terms?.description?.first ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
