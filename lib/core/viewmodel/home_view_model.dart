import 'package:connectivityswift/connectivityswift.dart';
import 'package:explore_flutter/core/viewmodel/base_model.dart';

class HomeViewModel extends BaseModel {
  final Connectivityswift _connectivity = Connectivityswift();
  ConnectivityResult connectivityStatus;

  Future<void> setupPage() async {
    connectivityStatus = await _connectivity.checkConnectivity();
    notifyListeners();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult value) {
      if (connectivityStatus != value) {
        connectivityStatus = value;
        notifyListeners();
      }
    });
  }
}
