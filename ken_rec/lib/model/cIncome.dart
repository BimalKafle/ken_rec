class Income {
  static const tblName = "Income";
  static const colId = "id";
  static const colIName = "Item";
  static const colQty = "Piece";
  static const colKg = "Kg";
  static const colRate = "Rate";
  static const colTotal = "Total";
  static const colFkey = "cusId";
  static const colDate = "Date";

  int cusId;
  int id;
  int quantity;
  double rate;
  double total;
  String item;
  String date;
  double kg;

  Income(
      {this.id,
      this.item,
      this.cusId,
      this.quantity,
      this.kg,
      this.rate,
      this.total,
      this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colIName: item,
      colQty: quantity,
      colFkey: cusId,
      colRate: rate,
      colTotal: total,
      colDate: date,
      colKg: kg,
    };
    if (id != null) map[colId] = id;
    return map;
  }

  Income.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    item = map[colIName];
    quantity = map[colQty];
    cusId = map[colFkey];
    rate = map[colRate];
    total = map[colTotal];
    date = map[colDate];
    kg = map[colKg];
  }
}
