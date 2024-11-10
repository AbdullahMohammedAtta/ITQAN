
class CategoryData {
  CategoryData({
    required this.products,
    required this.metadata,
  });

  late List<Products> products;
  late Metadata metadata;

  CategoryData.fromJson(Map<String, dynamic> json) {
    products = List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    metadata = Metadata.fromJson(json['metadata']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['products'] = products.map((e) => e.toJson()).toList();
    data['metadata'] = metadata.toJson();
    return data;
  }

  @override
  String toString() {
    return 'CategoryData(products: $products, metadata: $metadata)';
  }
}

class Products {
  Products({
    required this.id,
    required this.order,
    required this.product,
    required this.productId,
  });

  late final int? id;
  late final int? order;
  late final Product product;
  late final int? productId;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    product = Product.fromJson(json['product']);
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order;
    data['product'] = product.toJson();
    data['productId'] = productId;
    return data;
  }

  @override
  String toString() {
    return 'Products(id: $id, order: $order, productId: $productId, product: $product)';
  }
}

class Product {
  Product({
    required this.id,
    required this.description,
    required this.discountedPriceCents,
    required this.maxQuantity,
    required this.minQuantity,
    required this.name,
    required this.priceCents,
    required this.quantity,
    required this.sku,
    required this.thumbUrl,
    required this.variants,
  });
  late int id;
  late String description;
  late int? discountedPriceCents;
  late int maxQuantity;
  late int minQuantity;
  late String name;
  late int? priceCents;
  late int quantity;
  late String? sku;
  late String? thumbUrl;
  late List<Variants> variants;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    discountedPriceCents = json['discountedPriceCents'];
    maxQuantity = json['maxQuantity'];
    minQuantity = json['minQuantity'];
    name = json['name'];
    priceCents = json['priceCents'];
    quantity = json['quantity'];
    sku = json['sku'];
    thumbUrl = json['thumbUrl'];
    variants = List.from(json['variants']).map((e)=>Variants.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['discountedPriceCents'] = discountedPriceCents;
    data['maxQuantity'] = maxQuantity;
    data['minQuantity'] = minQuantity;
    data['name'] = name;
    data['priceCents'] = priceCents;
    data['quantity'] = quantity;
    data['sku'] = sku;
    data['thumbUrl'] = thumbUrl;
    data['variants'] = variants.map((e)=>e.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'Product(id: $id,description: $description, '
        'discountedPriceCents: $discountedPriceCents, maxQuantity: $maxQuantity, minQuantity: $minQuantity, '
        ' name: $name, priceCents: $priceCents, quantity: $quantity, '
        'sku: $sku, thumbUrl: $thumbUrl, variants: $variants)';
  }

}

class Variants {
  Variants({
    required this.id,
    required this.sku,
    required this.quantity,
    required this.priceCents,
    required this.discountedPriceCents,
    required this.productId,
  });
  late int id;
  late String sku;
  late int quantity;
  late int priceCents;
  late int discountedPriceCents;
  late int productId;

  Variants.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sku = json['sku'];
    quantity = json['quantity'];
    priceCents = json['priceCents'];
    discountedPriceCents = json['discountedPriceCents'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['quantity'] = quantity;
    data['priceCents'] = priceCents;
    data['discountedPriceCents'] = discountedPriceCents;
    data['productId'] = productId;
    return data;
  }


  @override
  String toString() {
    return 'Variants(id: $id, sku: $sku, quantity: $quantity, '
        'priceCents: $priceCents, discountedPriceCents: $discountedPriceCents, '
        'productId: $productId)';
  }

}

class Metadata {
  Metadata({
    required this.totalCount,
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
  });

  late int totalCount;
  int currentPage = 1;
  late int perPage;
  late int totalPages;

  Metadata.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['currentPage'] = currentPage;
    data['perPage'] = perPage;
    data['totalPages'] = totalPages;
    return data;
  }

  @override
  String toString() {
    return 'Metadata(totalCount: $totalCount, currentPage: $currentPage, '
        'perPage: $perPage, totalPages: $totalPages)';
  }
}
