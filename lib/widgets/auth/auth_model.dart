
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:themovedb/domain/api_client/api_client.dart';
import 'package:themovedb/domain/dataProvider/session_data_provider.dart';

class AuthModel extends ChangeNotifier{
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isAuthProgress= false;

  bool get canStartAuth => !_isAuthProgress;

  bool get  isAuth =>_isAuthProgress;

  Future<void> auth (BuildContext context ) async{
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if(login.isEmpty && password.isEmpty){
      _errorMessage = 'Please fill your login and password';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress=true;
    notifyListeners();
    String? sessionId;
    try {
    sessionId= await _apiClient.auth(login, password);
    }catch (e) {
      _errorMessage = 'Wrong Login password ';
}
    _isAuthProgress  =false;
    if(_errorMessage != null){
      notifyListeners();
      return;
    }
    if(sessionId == null){
      _errorMessage = 'Something went wrong ,try later';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    // ignore: use_build_context_synchronously
    unawaited(Navigator.of(context).pushReplacementNamed('/main_screen'));


  }
}

class AuthProvider extends InheritedNotifier {
  final Widget child;
  final AuthModel model;
  const AuthProvider({
    super.key,
    required this.child,
    required this.model
    }) : super(
      child: child,
      notifier: model
      );


  static AuthProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

}