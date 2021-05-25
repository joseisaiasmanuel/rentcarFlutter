import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rentcar/helper/prefs.dart';
import 'package:rentcar/utilizador/user.dart';

class LoginUser extends ChangeNotifier {
    LoginUser() {
     
   
  }
  User user;
  static Future<User> login(String login, String senha) async {
    var url = Uri.parse('http://192.168.42.140:4000/api/cliente/login');

Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {
      "nome": login,
      'senha': senha,
   
    };
    String credencias = json.encode(params);
    

    var response = await http.post(url, body:credencias, headers:headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    String nome= mapResponse["nome"];
    String email= mapResponse["email"];

     final user = User(nome,email);
     
      Future<User> getUser() async {
    String jsonS = await Prefs.getString("cliente.prefs");

    if (jsonS.isEmpty) {
      return null;
    } else {
      // convertendo String para Map/Objecto
      Map map = json?.decode(jsonS);

    var user = User.fromJSONLocal(map);
      print(user);
    }

    return user;
  }
}
}
