import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _userBalance = 0;
  int get userBalance => _userBalance;
  set userBalance(int _value) {
    _userBalance = _value;
  }

  bool _isRead = false;
  bool get isRead => _isRead;
  set isRead(bool _value) {
    _isRead = _value;
  }

  int _lessonsLength = 3;
  int get lessonsLength => _lessonsLength;
  set lessonsLength(int _value) {
    _lessonsLength = _value;
  }

  int _questionsLength = 3;
  int get questionsLength => _questionsLength;
  set questionsLength(int _value) {
    _questionsLength = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
