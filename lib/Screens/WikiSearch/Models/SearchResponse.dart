class SearchResponse {
  bool batchcomplete;
  Page page;
  Warnings warnings;
  Query query;
  Error error;

  SearchResponse({this.batchcomplete, this.page, this.warnings, this.query});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    page =
        json['continue'] != null ? new Page.fromJson(json['continue']) : null;
    warnings = json['warnings'] != null
        ? new Warnings.fromJson(json['warnings'])
        : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this.batchcomplete;
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    if (this.warnings != null) {
      data['warnings'] = this.warnings.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query.toJson();
    }
    return data;
  }
}

class Page {
  int gpsoffset;
  String page;

  Page({this.gpsoffset, this.page});

  Page.fromJson(Map<String, dynamic> json) {
    gpsoffset = json['gpsoffset'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpsoffset'] = this.gpsoffset;
    data['page'] = this.page;
    return data;
  }
}

class Warnings {
  Pageimages pageimages;

  Warnings({this.pageimages});

  Warnings.fromJson(Map<String, dynamic> json) {
    pageimages = json['pageimages'] != null
        ? new Pageimages.fromJson(json['pageimages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageimages != null) {
      data['pageimages'] = this.pageimages.toJson();
    }
    return data;
  }
}

class Pageimages {
  String warnings;

  Pageimages({this.warnings});

  Pageimages.fromJson(Map<String, dynamic> json) {
    warnings = json['warnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warnings'] = this.warnings;
    return data;
  }
}

class Query {
  List<Pages> pages;

  Query({this.pages});

  Query.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = new List<Pages>();
      json['pages'].forEach((v) {
        pages.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int pageid;
  int ns;
  String title;
  int index;
  Thumbnail thumbnail;
  Terms terms;

  Pages(
      {this.pageid,
      this.ns,
      this.title,
      this.index,
      this.thumbnail,
      this.terms});

  Pages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid'];
    ns = json['ns'];
    title = json['title'];
    index = json['index'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this.pageid;
    data['ns'] = this.ns;
    data['title'] = this.title;
    data['index'] = this.index;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.terms != null) {
      data['terms'] = this.terms.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String source;
  int width;
  int height;

  Thumbnail({this.source, this.width, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Terms {
  List<String> description;

  Terms({this.description});

  Terms.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}

class Error {
  String code;
  String info;
  String dfd;

  Error({this.code, this.info, this.dfd});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    dfd = json['dfd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['info'] = this.info;
    data['dfd'] = this.dfd;
    return data;
  }
}
