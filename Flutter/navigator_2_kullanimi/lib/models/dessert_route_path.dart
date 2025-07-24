class DessertRoutePath {
  final int? id;
  final bool isUnknown;
  DessertRoutePath.home() : id = null, isUnknown = false;
  DessertRoutePath.details(this.id) : isUnknown = false;
  DessertRoutePath.unknown() : id = null, isUnknown = true;
  bool get isHomePage => id == null && !isUnknown;
  bool get isDetailsPage => id != null && !isUnknown;
}
