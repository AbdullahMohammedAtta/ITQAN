class ApiResponse {
  final bool success;
  final List<Product> data;

  ApiResponse({
    required this.success,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List? ?? [];
    List<Product> products = dataList.map((item) => Product.fromJson(item)).toList();

    return ApiResponse(
      success: json['success'] ?? false,
      data: products,
    );
  }

  @override
  String toString() {
    return 'ApiResponse(success: $success, data: $data)';
  }
}

class Product {
  final int id;
  final String description;
  final int discountedPriceCents;
  final int maxQuantity;
  final int minQuantity;
  final String name;
  final int priceCents;
  final String pricingUnit;
  final int quantity;
  final String ribbonLabel;
  final String sku;
  final String status;
  final String thumbUrl;
  final List<String> thumbUrls;

  Product({
    required this.id,
    required this.description,
    required this.discountedPriceCents,
    required this.maxQuantity,
    required this.minQuantity,
    required this.name,
    required this.priceCents,
    required this.pricingUnit,
    required this.quantity,
    required this.ribbonLabel,
    required this.sku,
    required this.status,
    required this.thumbUrl,
    required this.thumbUrls,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      description: json['description'] ?? '',
      discountedPriceCents: json['discountedPriceCents'],
      maxQuantity: json['maxQuantity'] ?? 0,
      minQuantity: json['minQuantity'] ?? 0,
      name: json['name'] ?? '',
      priceCents: json['priceCents'] ?? 0,
      pricingUnit: json['pricingUnit'] ?? '',
      quantity: json['quantity'] ?? 0,
      ribbonLabel: json['ribbonLabel'] ?? '',
      sku: json['sku'] ?? '',
      status: json['status'] ?? '',
      thumbUrl: json['thumbUrl'] ?? '',
      thumbUrls: List<String>.from(json['thumbUrls'] ?? []),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, priceCents: $priceCents)';
  }
}
