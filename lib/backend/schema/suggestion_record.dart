import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SuggestionRecord extends FirestoreRecord {
  SuggestionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "heading" field.
  String? _heading;
  String get heading => _heading ?? '';
  bool hasHeading() => _heading != null;

  void _initializeFields() {
    _heading = snapshotData['heading'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suggestion');

  static Stream<SuggestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuggestionRecord.fromSnapshot(s));

  static Future<SuggestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuggestionRecord.fromSnapshot(s));

  static SuggestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuggestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuggestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuggestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuggestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuggestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuggestionRecordData({
  String? heading,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'heading': heading,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuggestionRecordDocumentEquality implements Equality<SuggestionRecord> {
  const SuggestionRecordDocumentEquality();

  @override
  bool equals(SuggestionRecord? e1, SuggestionRecord? e2) {
    return e1?.heading == e2?.heading;
  }

  @override
  int hash(SuggestionRecord? e) => const ListEquality().hash([e?.heading]);

  @override
  bool isValidKey(Object? o) => o is SuggestionRecord;
}
