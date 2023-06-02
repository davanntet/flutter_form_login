

import 'package:flutter/material.dart';
import 'package:flutter_form_login/utils/UserData.dart';
import 'package:flutter_form_login/views/LoginPage.dart';
import 'package:flutter_form_login/views/ProfilePage.dart';

Route<dynamic> GenerateRouter(RouteSettings route){
    UserData data;
    switch(route.name){
      case "profile":{
        data = route.arguments as UserData;
        return MaterialPageRoute(builder: (_)=>ProfilePage(user: data,));
      }
      case "login":{
        return MaterialPageRoute(builder: (_)=>LoginPage());
      }
    }
    return MaterialPageRoute(builder: (_)=>LoginPage());
}