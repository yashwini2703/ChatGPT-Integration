import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "chathistory" field.
  List<String>? _chathistory;
  List<String> get chathistory => _chathistory ?? const [];
  bool hasChathistory() => _chathistory != null;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _chathistory = getDataList(snapshotData['chathistory']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('history');

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  String? day,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.day == e2?.day &&
        listEquality.equals(e1?.chathistory, e2?.chathistory);
  }

  @override
  int hash(HistoryRecord? e) =>
      const ListEquality().hash([e?.day, e?.chathistory]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
