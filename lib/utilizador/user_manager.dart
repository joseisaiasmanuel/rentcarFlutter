import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
int id;
String nome;
String genero;
String bilhete;
String telefone;
String email;
String senha;
DateTime dataNascimento;
String foto;
String token;

User.fromJson(Map<String, dynamic>map){
  this.id= map["id"];
  this.nome= map["nome"];
  this.genero= map["genero"];
  this.bilhete= map["bilhete"];
  this.telefone= map["telefone"];
  this.email= map["email"];
  this.senha= map["senha"];
  this.dataNascimento= map["dataNascimento"];
  this.foto= map["foto"];
  this.token= map["token"];
}

User.toJson(){
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data["id"]=this.id;
  data["nome"]=this.nome;
  data["genero"]=this.genero;
  data["bilhete"]=this.bilhete;
  data["telefone"]=this.telefone;
  data["email"]=this.email;
  data["senha"]=this.senha;
  data["dataNascimento"]=this.dataNascimento;
  data["foto"]=this.foto;
  data["token"]=this.token;
  

}





User(this.nome,this.email);
  @override
  String toString() {
    return "User(id: $id, nome: $nome, genero: $genero bilhete: $bilhete, email $email, dataNascimento: $dataNascimento, telefone: $telefone, foto: $foto, token: $token, senha:$senha)";
  }









 





   








}