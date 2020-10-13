import 'package:explore_flutter/core/viewmodel/add_minus_view_model.dart';
import 'base_model.dart';

class EditValueViewModel extends BaseModel {
  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
  }

  AddMinusViewModel addMinusVM;

  void initCount() {
    _count = addMinusVM.valueCount;
  }

  void toAdd() {
    _count++;
    addMinusVM.valueCount = _count;
    notifyListeners();
  }

  void toMinus() {
    _count--;
    addMinusVM.valueCount = _count;
    notifyListeners();
  }
}
