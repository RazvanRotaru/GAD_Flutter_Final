part of models;

abstract class ProductEntry implements Built<ProductEntry, ProductEntryBuilder> {
  factory ProductEntry([void Function(ProductEntryBuilder)? updates]) = _$ProductEntry;

  factory ProductEntry.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  ProductEntry._();

  Product get product;

  String get id;

  num get quantity;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ProductEntry> get serializer => _$productEntrySerializer;
}
