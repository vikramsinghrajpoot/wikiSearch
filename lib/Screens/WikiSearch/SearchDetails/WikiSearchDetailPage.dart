import 'package:flutter/material.dart';
import 'package:wikisearch/Screens/Constants/Constants.dart';
import '../Models/SearchResponse.dart';

class WikiSearchDetailPage extends StatelessWidget {
  final Pages page;
  const WikiSearchDetailPage({Key key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessages.details.string()),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                page.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              page?.thumbnail != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        page?.thumbnail?.source,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Icon(
                      Icons.photo_size_select_actual,
                      size: 200,
                    ),
              SizedBox(
                height: 15,
              ),
              Text(page?.terms?.description?.join(" ") ?? "")
            ],
          ),
        ),
      ),
    );
  }
}
