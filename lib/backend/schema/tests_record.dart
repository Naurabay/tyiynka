import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsRecord extends FirestoreRecord {
  TestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coin" field.
  int? _coin;
  int get coin => _coin ?? 0;
  bool hasCoin() => _coin != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "is_completed" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _coin = castToType<int>(snapshotData['coin']);
    _id = castToType<int>(snapshotData['id']);
    _isCompleted = snapshotData['is_completed'] as bool?;
    _name = snapshotData['name'] as String?;
    _time = castToType<int>(snapshotData['time']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsRecord.fromSnapshot(s));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsRecord.fromSnapshot(s));

  static TestsRecord fromSnapshot(DocumentSnapshot snapshot) => TestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestsRecordData({
  int? coin,
  int? id,
  bool? isCompleted,
  String? name,
  int? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coin': coin,
      'id': id,
      'is_completed': isCompleted,
      'name': name,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestsRecordDocumentEquality implements Equality<TestsRecord> {
  const TestsRecordDocumentEquality();

  @override
  bool equals(TestsRecord? e1, TestsRecord? e2) {
    return e1?.coin == e2?.coin &&
        e1?.id == e2?.id &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.name == e2?.name &&
        e1?.time == e2?.time;
  }

  @override
  int hash(TestsRecord? e) => const ListEquality()
      .hash([e?.coin, e?.id, e?.isCompleted, e?.name, e?.time]);

  @override
  bool isValidKey(Object? o) => o is TestsRecord;
}
