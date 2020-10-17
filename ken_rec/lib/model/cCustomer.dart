class Customer {
  static const tblName = 'Customer';
  static const colId = 'id';
  static const colName = 'Name';
  static const colNumber = 'Number';
  static const colFid = 'Fid';
  int id;
  String name;
  String number;
  int fid;
  Customer({this.id, this.name, this.number, this.fid});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colName: name, colNumber: number, colFid: fid};
    if (id != null) map[colId] = id;
    return map;
  }

  Customer.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    number = map[colNumber];
    fid = map[colFid];
  }
}
