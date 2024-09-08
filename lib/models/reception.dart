part of models;

abstract class Reception implements Built<Reception, ReceptionBuilder> {
  factory Reception([void Function(ReceptionBuilder)? updates]) = _$Reception;

  factory Reception.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  Reception._();

  BuiltList<ProductEntry> get entries;

  String get creatorName;

  String get invoiceNr;

  String get company;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Reception> get serializer => _$receptionSerializer;
}
