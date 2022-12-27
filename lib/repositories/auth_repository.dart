

import 'package:flutter/animation.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;

    }catch(e){
      throw e;
    }

  }


  
  Future<dynamic> signUpApi(dynamic data) async {

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;

    }catch(e){
      throw e;
    }

  }

}