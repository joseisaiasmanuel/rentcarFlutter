import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:rentcar/helper/api_responce.dart';
import 'package:rentcar/helper/prefs.dart';
import 'package:rentcar/utilizador/user.dart';
import 'package:rentcar/widgets/const.dart';


class UserManager extends ChangeNotifier {
  UserManager() {
    getUser();
  }
  User user;
  
  Future<ApiResponse<User>> login(String email, String senha) async {
    try {
      var url = '$BASE_URL/cliente/login';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'email': email,
        'senha': senha,
        
      };

      

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);
    

      Map mapRensponse = json.decode(response.body);
        print(mapRensponse);

      if (response.statusCode == 200) {
        final client = User.fromJson(mapRensponse);
        client.save();
        notifyListeners();
        return ApiResponse.ok(client);
      }
      notifyListeners();

      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      // notifyListeners();
      return ApiResponse.error("Impossivel fazer login");
    }
  }
  

  // metodo para cadastrar o usuario 
  Future<ApiResponse<User>> signup(User user) async {
    try {
      var url = '$BASE_URL/cliente/';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'nome':user.nome,
        'genero': user.genero,
        'bilhete': user.bilhete,
        'telefone': user.telefone,
        'email': user.email,
        'senha': user.senha,
        "dataNascimento":"1997/10/26"
        
      
      };

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);

      Map mapRensponse = json.decode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        final client = User.fromJson(mapRensponse);
        client.save();
        notifyListeners();
        return ApiResponse.ok(client);
      }
      notifyListeners();

      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      // notifyListeners();
      return ApiResponse.error("Impossivel fazer login");
    }
  }

  Future<User> getUser() async {
    String jsonS = await Prefs.getString("Cliente.prefs");

    if (jsonS.isEmpty) {
      return null;
    } else {
      // convertendo String para Map/Objecto
      Map map = json?.decode(jsonS);

      user = User.fromJSONLocal(map);
      print(user);
    }

    return user;
  }


}