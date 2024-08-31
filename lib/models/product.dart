part of models;

abstract class Product implements Built<Product, ProductBuilder> {
  factory Product([void Function(ProductBuilder)? updates]) = _$Product;

  factory Product.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  Product._();

  int get id;

  @BuiltValueField(wireName: 'short_name')
  String get shortName;

  String get name;

  @BuiltValueField(wireName: 'bar_code')
  String get barCode;

  num get price;

  BuiltList<String> get categories;

  String get summary;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Product> get serializer => _$productSerializer;
}
