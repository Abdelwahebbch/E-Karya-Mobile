import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';

class AppwriteService extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late Databases databases;

  models.User? _user;
  models.User? get user => _user;
  late bool isLoggedin;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool isTenant = false;
  bool isLandlord = true;
  AppwriteService() {
    _init();
  }

  void _init() {
    client
        .setEndpoint('https://fra.cloud.appwrite.io/v1')
        .setProject('697753f00000e8bb0329')
        .setSelfSigned(status: true);

    account = Account(client);
    databases = Databases(client);
    checkSession();
  }

  Future<void> checkSession() async {
    try {
      debugPrint("Aloo try");
      _user = await account.get();
      isLoggedin = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Aloo try 2");
      isLoggedin = false;
      _user = null;
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password, String name) async {
    _isLoading = true;
    notifyListeners();
    try {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      await login(email: email, password: password);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      _user = await account.get();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      _user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
