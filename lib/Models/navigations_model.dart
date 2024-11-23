class NavigationsResponse {
  bool success;
  List<Data> data;

  NavigationsResponse({
    required this.success,
    required this.data,
  });

  factory NavigationsResponse.fromJson(Map<String, dynamic> json) =>
      NavigationsResponse(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  @override
  String toString() =>
      'NavigationsResponse(success: $success, data: $data)';
}

class Data {
  int id;
  bool isDisabled;
  List<Item> items;
  String? labelAr;
  String label;
  int level;
  int navigationableId;
  String status;

  Data({
    required this.id,
    required this.isDisabled,
    required this.items,
    required this.labelAr,
    required this.label,
    required this.level,
    required this.navigationableId,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    isDisabled: json["isDisabled"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    labelAr: json["labelAr"],
    label: json["label"],
    level: json["level"],
    navigationableId: json["navigationableId"],
    status: json["status"],
  );

  @override
  String toString() =>
      'Data(id: $id, isDisabled: $isDisabled, labelAr: $labelAr, label: $label, '
          'level: $level, navigationableId: $navigationableId, status: $status, items: $items)';
}

class Item {
  int id;
  int companyId;
  bool isDisabled;
  List<Item> items;
  String? labelAr;
  String label;
  int? level;
  int navigationableId;
  int order;

  Item({
    required this.id,
    required this.companyId,
    required this.isDisabled,
    required this.items,
    required this.labelAr,
    required this.label,
    required this.level,
    required this.navigationableId,
    required this.order,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    companyId: json["companyId"],
    isDisabled: json["isDisabled"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    labelAr: json["labelAr"],
    label: json["label"],
    level: json["level"],
    navigationableId: json["navigationableId"],
    order: json["order"],
  );

  @override
  String toString() =>
      'Item(id: $id, companyId: $companyId, isDisabled: $isDisabled, labelAr: $labelAr, label: $label, '
          'level: $level, navigationableId: $navigationableId, order: $order, items: $items)';
}
