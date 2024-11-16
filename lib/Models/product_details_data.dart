class DetailsResponse {
  bool success;
  ProductDetailsData data;

  DetailsResponse({
    required this.success,
    required this.data,
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) {
    return DetailsResponse(
      success: json['success'],
      data: ProductDetailsData.fromJson(json['data']),
    );
  }

  @override
  String toString() {
    return 'DetailsResponse(success: $success, data: $data)';
  }
}

class ProductDetailsData {
  int id;
  List<ImageUrl> imagesUrls;
  String? nameAr;
  String? name;
  int priceCents;
  String? sku;
  String? status;
  String? strippedDescription;
  String? thumbUrl;
  List<String?> thumbUrls;
  List<Variant> variants;

  ProductDetailsData({
    required this.id,
    required this.imagesUrls,
    required this.nameAr,
    required this.name,
    required this.priceCents,
    required this.sku,
    required this.status,
    required this.strippedDescription,
    required this.thumbUrl,
    required this.thumbUrls,
    required this.variants,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
    return ProductDetailsData(
      id: json['id'],
      imagesUrls: (json['imagesUrls'] as List)
          .map((imageUrl) => ImageUrl.fromJson(imageUrl))
          .toList(),
      nameAr: json['nameAr'],
      name: json['name'],
      priceCents: json['priceCents'],
      sku: json['sku'],
      status: json['status'],
      strippedDescription: json['strippedDescription'],
      thumbUrl: json['thumbUrl'],
      thumbUrls: List<String?>.from(json['thumbUrls']),
      variants: (json['variants'] as List)
          .map((variant) => Variant.fromJson(variant))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'ProductDetailsData(id: $id, imagesUrls: $imagesUrls, nameAr: $nameAr, name: $name, priceCents: $priceCents, sku: $sku, status: $status, strippedDescription: $strippedDescription, thumbUrl: $thumbUrl, thumbUrls: $thumbUrls, variants: $variants)';
  }
}

class ImageUrl {
  int id;
  List<String?> urls;

  ImageUrl({required this.id, required this.urls});

  factory ImageUrl.fromJson(Map<String?, dynamic> json) {
    return ImageUrl(
      id: json['id'],
      urls: List<String?>.from(json['urls']),
    );
  }

  @override
  String toString() {
    return 'ImageUrl(id: $id, urls: $urls)';
  }
}

class Variant {
  int id;
  List<String?> values;
  String? weight;
  String? sku;
  dynamic barCode; // Keep this as dynamic if the type is not known.
  int quantity;
  int minQuantity;
  int maxQuantity;
  int priceCents;
  int discountedPriceCents;
  List<int> imageIds;

  Variant({
    required this.id,
    required this.values,
    required this.weight,
    required this.sku,
    required this.barCode,
    required this.quantity,
    required this.minQuantity,
    required this.maxQuantity,
    required this.priceCents,
    required this.discountedPriceCents,
    required this.imageIds,
  });

  factory Variant.fromJson(Map<String?, dynamic> json) {
    return Variant(
      id: json['id'],
      values: List<String?>.from(json['values']),
      weight: json['weight'],
      sku: json['sku'],
      barCode: json['barCode'], // Modify if a specific type is known
      quantity: json['quantity'],
      minQuantity: json['minQuantity'],
      maxQuantity: json['maxQuantity'],
      priceCents: json['priceCents'],
      discountedPriceCents: json['discountedPriceCents'],
      imageIds: List<int>.from(json['imageIds']),
    );
  }

  @override
  String toString() {
    return 'Variant(id: $id, values: $values, weight: $weight, sku: $sku, barCode: $barCode, quantity: $quantity, minQuantity: $minQuantity, maxQuantity: $maxQuantity, priceCents: $priceCents, discountedPriceCents: $discountedPriceCents, imageIds: $imageIds)';
  }
}


// class DetailsResponse {
//   bool success;
//   ProductDetailsData data;
//
//   DetailsResponse({
//     required this.success,
//     required this.data,
//   });
//
//   factory DetailsResponse.fromJson(Map<String, dynamic> json) {
//     return DetailsResponse(
//       success: json['success'],
//       data: ProductDetailsData.fromJson(json['data']),
//     );
//   }
// }
//
// class ProductDetailsData {
//   int id;
//   //bool addShippingFees;
//   //String? barCode;
//   //List<Collection> collections;
//   //int companyId;
//   //dynamic defaultVariant; // Can be replaced with a specific type if known
//   //String? descriptionAr;
//   //String? descriptionEn;
//   //int discountedPriceCents;
//   //dynamic googleProductCategory; // Can be replaced with a specific type if known
//   //String? handle;
//   //bool hideReviews;
//   List<ImageUrl> imagesUrls;
//   // bool isLimited;
//   // bool isOnSale;
//   // bool isPhysical;
//   // bool isTracked;
//   // bool isVat;
//   //int maxQuantity;
//   //int minQuantity;
//   String? nameAr;
//   String? nameEn;
//   int priceCents;
//   //String? pricedBy;
//   //String? pricingUnit;
//   //List<dynamic> prodExtras; // Can be replaced with a specific type if known
//   //int quantity;
//   //String? ribbonLabelAr;
//  // String? ribbonLabelEn;
//   String? sku;
//   String? status;
//   String? strippedDescription;
//   //List<String?> tags;
//   String? thumbUrl;
//   List<String?> thumbUrls;
//   //dynamic type; // Can be replaced with a specific type if known
//   List<Variant> variants;
//   //dynamic vendor; // Can be replaced with a specific type if known
//   //double weight;
//
//   ProductDetailsData({
//     required this.id,
//     //required this.addShippingFees,
//     //required this.barCode,
//     //required this.collections,
//     // required this.companyId,
//     // required this.defaultVariant,
//     // required this.descriptionAr,
//     // required this.descriptionEn,
//     // required this.discountedPriceCents,
//     // required this.googleProductCategory,
//     // required this.handle,
//     //required this.hideReviews,
//     required this.imagesUrls,
//     // required this.isLimited,
//     // required this.isOnSale,
//     // required this.isPhysical,
//     // required this.isTracked,
//     // required this.isVat,
//     // required this.maxQuantity,
//     // required this.minQuantity,
//     required this.nameAr,
//     required this.nameEn,
//     required this.priceCents,
//     // required this.pricedBy,
//     // required this.pricingUnit,
//     // required this.prodExtras,
//     // required this.quantity,
//     // required this.ribbonLabelAr,
//     // required this.ribbonLabelEn,
//     required this.sku,
//     required this.status,
//     required this.strippedDescription,
//     // required this.tags,
//     required this.thumbUrl,
//     required this.thumbUrls,
//     // required this.type,
//     required this.variants,
//     // required this.vendor,
//     // required this.weight,
//   });
//
//   factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
//     return ProductDetailsData(
//       id: json['id'],
//       //addShippingFees: json['addShippingFees'],
//       //barCode: json['barCode'],
//       // collections: (json['collections'] as List)
//       //     .map((collection) => Collection.fromJson(collection))
//       //     .toList(),
//       // companyId: json['companyId'],
//       // defaultVariant: json['defaultVariant'], // Modify if a specific type is known
//       // descriptionAr: json['descriptionAr'],
//       // descriptionEn: json['descriptionEn'],
//       // discountedPriceCents: json['discountedPriceCents'],
//       // googleProductCategory: json['googleProductCategory'], // Modify if a specific type is known
//       // handle: json['handle'],
//       //hideReviews: json['hideReviews'],
//       imagesUrls: (json['imagesUrls'] as List)
//           .map((imageUrl) => ImageUrl.fromJson(imageUrl))
//           .toList(),
//       // isLimited: json['isLimited'],
//       // isOnSale: json['isOnSale'],
//       // isPhysical: json['isPhysical'],
//       // isTracked: json['isTracked'],
//       // isVat: json['isVat'],
//       // maxQuantity: json['maxQuantity'],
//       // minQuantity: json['minQuantity'],
//       nameAr: json['nameAr'],
//       nameEn: json['nameEn'],
//       priceCents: json['priceCents'],
//       // pricedBy: json['pricedBy'],
//       // pricingUnit: json['pricingUnit'],
//       // prodExtras: json['prodExtras'], // Modify if a specific type is known
//       // quantity: json['quantity'],
//       // ribbonLabelAr: json['ribbonLabelAr'],
//       // ribbonLabelEn: json['ribbonLabelEn'],
//       sku: json['sku'],
//       status: json['status'],
//       strippedDescription: json['strippedDescription'],
//       //tags: List<String?>.from(json['tags']),
//       thumbUrl: json['thumbUrl'],
//       thumbUrls: List<String?>.from(json['thumbUrls']),
//       //type: json['type'], // Modify if a specific type is known
//       variants: (json['variants'] as List)
//           .map((variant) => Variant.fromJson(variant))
//           .toList(),
//       //vendor: json['vendor'], // Modify if a specific type is known
//       //weight: json['weight'],
//     );
//   }
// }
//
//
// class ImageUrl {
//   int id;
//   List<String?> urls;
//
//   ImageUrl({required this.id, required this.urls});
//
//   factory ImageUrl.fromJson(Map<String?, dynamic> json) {
//     return ImageUrl(
//       id: json['id'],
//       urls: List<String?>.from(json['urls']),
//     );
//   }
// }
//
// class Variant {
//   int id;
//   List<String?> values;
//   //bool isPhysical;
//   String? weight;
//   String? sku;
//   dynamic barCode; // Can be replaced with a specific type if known
//   int quantity;
//   // bool isTracked;
//   // bool isLimited;
//   // bool isOnSale;
//   int minQuantity;
//   int maxQuantity;
//   int priceCents;
//   int discountedPriceCents;
//   List<int> imageIds;
//
//   Variant({
//     required this.id,
//     required this.values,
//     //required this.isPhysical,
//     required this.weight,
//     required this.sku,
//     required this.barCode,
//     required this.quantity,
//     // required this.isTracked,
//     // required this.isLimited,
//     // required this.isOnSale,
//     required this.minQuantity,
//     required this.maxQuantity,
//     required this.priceCents,
//     required this.discountedPriceCents,
//     required this.imageIds,
//   });
//
//   factory Variant.fromJson(Map<String?, dynamic> json) {
//     return Variant(
//       id: json['id'],
//       values: List<String?>.from(json['values']),
//       //isPhysical: json['isPhysical'],
//       weight: json['weight'],
//       sku: json['sku'],
//       barCode: json['barCode'], // Modify if a specific type is known
//       quantity: json['quantity'],
//       // isTracked: json['isTracked'],
//       // isLimited: json['isLimited'],
//       // isOnSale: json['isOnSale'],
//       minQuantity: json['minQuantity'],
//       maxQuantity: json['maxQuantity'],
//       priceCents: json['priceCents'],
//       discountedPriceCents: json['discountedPriceCents'],
//       imageIds: List<int>.from(json['imageIds']),
//     );
//   }
// }
//
// //class Collection {
// //   int id;
// //   String? nameEn;
// //   String? nameAr;
// //   String? name;
// //
// //   Collection({required this.id, required this.nameEn, required this.nameAr, required this.name});
// //
// //   factory Collection.fromJson(Map<String?, dynamic> json) {
// //     return Collection(
// //       id: json['id'],
// //       nameEn: json['nameEn'],
// //       nameAr: json['nameAr'],
// //       name: json['name'],
// //     );
// //   }
// // }