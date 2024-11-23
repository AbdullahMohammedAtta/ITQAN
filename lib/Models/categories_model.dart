class ApiCategoriesResponse {
  final bool success;
  final List<dynamic> data;
  final Metadata metadata;

  ApiCategoriesResponse({
    required this.success,
    required this.data,
    required this.metadata,
  });

  // Factory method to create an instance from JSON
  factory ApiCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return ApiCategoriesResponse(
      success: json['success'],
      data: (json['data'])
          .map((item) => Product.fromJson(item))
          .toList(),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}

// Class representing each product
class Product {
  final int id;
  final String name;


  Product({
    required this.id,
    required this.name,
  });

  // Factory method to create an instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}

// Class representing the metadata
class Metadata {
  final int totalCount;
  final int currentPage;
  final int perPage;
  final int totalPages;

  Metadata({
    required this.totalCount,
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
  });

  // Factory method to create an instance from JSON
  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      totalCount: json['totalCount'],
      currentPage: json['currentPage'],
      perPage: json['perPage'],
      totalPages: json['totalPages'],
    );
  }
}
