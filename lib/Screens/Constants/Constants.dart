const BASE_URL = "https://en.wikipedia.org//w/api.php?action=query&format=json";
const SEARCH =
    "&prop=pageimages|pageterms&generator=prefixsearch&redirects=2&formatversion=2&piprop=thumbnail&pithumbsize=300&pilimit=20&wbptterms=description&gpssearch=";

enum AppMessages { noRecodFound, searchHint, wikiSearch, searchDesc, details }

extension AppMessagesExt on AppMessages {
  string() {
    switch (this) {
      case AppMessages.noRecodFound:
        return "No record found";
        break;

      case AppMessages.searchHint:
        return "Type here for search";

      case AppMessages.wikiSearch:
        return "Wiki Search";
      case AppMessages.searchDesc:
        return "You can enter your search criteria in search bar";
       case AppMessages.details:
        return "Details";
      default:
    }
  }
}
