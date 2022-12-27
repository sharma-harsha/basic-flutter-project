import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:mvvm/repositories/auth_repository.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignloading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value) {
          setloading(false);
          Utils.flushBarErrorMessage('Login Successfully' , context);
          Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
       

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setloading(false);
        Utils.flushBarErrorMessage(error.toString() , context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

   Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignloading(true);
    _myRepo.signUpApi(data).then((value) {
          setSignloading(false);
          Utils.flushBarErrorMessage('sign Successfully' , context);
          Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
       

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignloading(false);
        Utils.flushBarErrorMessage(error.toString() , context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


}
