part of models;

abstract class ReceptionRecord implements Built<ReceptionRecord, ReceptionRecordBuilder> {
  factory ReceptionRecord([void Function(ReceptionRecordBuilder)? updates]) = _$ReceptionRecord;

  factory ReceptionRecord.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  ReceptionRecord._();

  Reception get data;

  String get filePath;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ReceptionRecord> get serializer => _$receptionRecordSerializer;
}
