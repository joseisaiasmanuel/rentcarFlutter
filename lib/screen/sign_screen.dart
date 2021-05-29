import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/utilizador/user.dart';
import 'package:rentcar/utilizador/user_manager.dart';
import 'package:rentcar/widgets/appButton.dart';
import 'package:rentcar/widgets/appTextForm.dart';
import 'package:rentcar/widgets/messenger.dart';
import 'package:rentcar/widgets/navegacao.dart';

import 'bottom_nav_screen.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  final _focoPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Cadastrar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: (0.0),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          elevation: 8,
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              AppText('Nome', 'Digite seu Nome',
                  validator: _validateNome,
                  keyboardType: TextInputType.text,
                  onSaved: (nome)=>user.nome=nome,
                
                  textInputAction: TextInputAction.next,
                  nextFocus: _focoPassword),
              const SizedBox(height: 16),
              AppText('Genero', 'Digite seu Genero',
                  validator: _validateGenero,
                  keyboardType: TextInputType.text,
                  onSaved: (genero)=>user.genero=genero,
                  textInputAction: TextInputAction.next,
                  nextFocus: _focoPassword),
              const SizedBox(height: 16),
              AppText('bilhete', 'Digite seu numero de BI',
                  validator: _validateBilhete,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onSaved: (bilhete)=>user.bilhete=bilhete,
                  nextFocus: _focoPassword),
              const SizedBox(height: 16),
              AppText(
                'Telefone',
                'Digite seu número de telefone',
                validator: _validateTelefone,
                keyboardType: TextInputType.number,
                 onSaved: (telefone)=>user.telefone=telefone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              AppText(
                'E-mail',
                'Digite seu email',
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                 onSaved: (email)=>user.email=email,
              ),
              const SizedBox(height: 16),
              AppText(
                'Password',
                'Digite sua password',
                password: true,
                validator: _validatePassword,
                keyboardType: TextInputType.text,
                focusNode: _focoPassword,
                 onSaved: (senha)=>user.senha=senha,
              ),
              SizedBox(
                height: 15,
              ),
              AppButton('Entrar', onPressed: _onClickLogin)
            ],
          ),
        ),
      ),
    );
  }

  String _validateNome(String value) {
    if (value.isEmpty) return 'Digete o nome';
    return null;
  }

  String _validateGenero(String value) {
    if (value.isEmpty) return 'Digete o genero';
    return null;
  }

  String _validateBilhete(String value) {
    if (value.isEmpty) return 'o BI deve conter apenas 14 caracter';
    return null;
  }

  String _validateTelefone(String value) {
    if (value.isEmpty) return 'o número de telefone pelo menus deve caracter 9';
    return null;
  }

  String _validateEmail(String value) {
    if (value.isEmpty || !value.contains("@")) return 'E-mail Inválido';
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 9) {
      return 'A senha precisa ter pelo menus 9 caracter';
    }
    return null;
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    context.read<UserManager>().signup(user);
  if ( user != null){
  push(context, BottomNavBar(), replace: true);
  
  }else {
    print("erro ao fazer o cadastro");

  }

  }
}
