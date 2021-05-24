import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcar/utilizador/user_manager.dart';

class LoginUser {
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

    return user;
  }
}
