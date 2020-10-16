class CLot {
  static const tblName = 'c_lot';
  static const colId = 'id';
  static const colName = 'Name';
  static const colDate = 'Date';
  int id;
  String name;
  String date;
  CLot({this.id, this.name, this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colName: name, colDate: date};
    if (id != null) map[colId] = id;
    return map;
  }

  CLot.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[tblName];
    date = map[colDate];
  }
}
