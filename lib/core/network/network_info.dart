import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected => connectivity.checkConnectivity().then<bool>(
        (value) =>
            value == ConnectivityResult.wifi ||
            value == ConnectivityResult.mobile,
        onError: (_) => false,
      );
}
