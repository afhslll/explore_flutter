import 'base_model.dart';

class AddMinusViewModel extends BaseModel {
  bool _isToAdd = true;
  bool get isToAdd => _isToAdd;
  set isToAdd(bool value) {
    _isToAdd = value;
  }

  int _totalCount = 0;
  int get totalCount => _totalCount;

  int _valueCount = 0;
  int get valueCount => _valueCount;
  set valueCount(int value) {
    _valueCount = value;
    notifyListeners();
  }

  void addTotalCount() {
    _totalCount += _valueCount;
    notifyListeners();
  }

  void minusTotalCount() {
    _totalCount -= _valueCount;
    notifyListeners();
  }
}
