import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CreatedAtField implements JsonConverter<DateTime, dynamic> {
  const CreatedAtField();

  @override
  DateTime fromJson(dynamic timestamp) {
    timestamp as Timestamp;
    return timestamp.toDate();
  }

  @override
  dynamic toJson(DateTime dateTime) {
    return FieldValue.serverTimestamp();
  }
}

class UpdatedAtField implements JsonConverter<DateTime, dynamic> {
  const UpdatedAtField();

  @override
  DateTime fromJson(dynamic timestamp) {
    timestamp as Timestamp;
    return timestamp.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
