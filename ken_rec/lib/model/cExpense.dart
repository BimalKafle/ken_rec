class Expense {
  static const tblName = "Expenses";
  static const colId = "id";
  static const colIName = "Item";
  static const colQty = "Quantity";
  static const colRate = "Rate";
  static const colTotal = "Total";
  static const colFkey = "lotId";
  static const colDate = "Date";

  int lotId;
  int id;
  int quantity;
  int rate;
  int total;
  String item;
  String date;

  Expense(
      {this.id,
      this.item,
      this.lotId,
      this.quantity,
      this.rate,
      this.total,
      this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colIName: item,
      colQty: quantity,
      colFkey: lotId,
      colRate: rate,
      colTotal: total,
      colDate: date,
    };
    if (id != null) map[colId] = id;
    return map;
  }

  Expense.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    item = map[colIName];
    quantity = map[colQty];
    lotId = map[colFkey];
    rate = map[colRate];
    total = map[colTotal];
    date = map[colDate];
  }
}
