import 'package:connectivity/connectivity.dart';
import 'package:explore_flutter/core/viewmodel/base_model.dart';

class HomeViewModel extends BaseModel {
  final Connectivity _connectivity = Connectivity();
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
