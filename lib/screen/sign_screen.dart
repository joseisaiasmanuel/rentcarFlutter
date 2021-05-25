import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rentcar/widgets/appButton.dart';
import 'package:rentcar/widgets/appTextForm.dart';

class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _generoController= TextEditingController();
  final _bilheteController= TextEditingController();
  final _telefoneController= TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _focoPassword= FocusNode();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.cyan,
      appBar: AppBar(
       backgroundColor: Colors.cyan,
        title: Text("Cadastrar", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        elevation: (0.0),
      ),
      body:_body(),
    
    );
  }
    _body() {
    return  Form(
        key: _formKey,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            elevation: 8,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: [

                AppText(
                   'Nome', 
                   'Digite seu Nome', 
                    controller:_nomeController, 
                    validator: _validateNome, 
                    keyboardType: TextInputType.text, 
                    textInputAction: TextInputAction.next,
                    nextFocus: _focoPassword
                    ), 

                const SizedBox( height: 16),
                  AppText(
                   'Genero', 
                   'Digite seu Genero', 
                    controller:_generoController, 
                    validator: _validateGenero, 
                    keyboardType: TextInputType.text, 
                    textInputAction: TextInputAction.next,
                    nextFocus: _focoPassword
                    ), 
                    const SizedBox( height: 16),
                     AppText(
                   'bilhete', 
                   'Digite seu numero de BI', 
                    controller:_bilheteController, 
                    validator: _validateBilhete, 
                    keyboardType: TextInputType.text, 
                    textInputAction: TextInputAction.next,
                    nextFocus: _focoPassword
                    ), 
                     const SizedBox( height: 16),
                       AppText(
                   'Telefone', 
                   'Digite seu número de telefone', 
                    controller:_telefoneController, 
                    validator: _validateTelefone, 
                    keyboardType: TextInputType.number, 
                    textInputAction: TextInputAction.next,
                    ), 
                    const SizedBox( height: 16),
                         AppText(
                   'E-mail', 
                   'Digite seu email', 
                    controller:_emailController, 
                    validator: _validateEmail, 
                    keyboardType: TextInputType.emailAddress, 
                    textInputAction: TextInputAction.next,
                    ), 
                    const SizedBox( height: 16),

               AppText(
                  'Password', 
                  'Digite sua password',
                  controller: _passController, 
                  password: true, 
                  validator: _validatePassword, 
                  keyboardType: TextInputType.text, 
                  focusNode: _focoPassword, 
               
                  ), 
                
                SizedBox(height: 15,),

                AppButton(
                  'Entrar', 
                    onPressed: _onClickLogin
                 
                )

              ],
            ),
          ),
        ),
      );
    
    
    }
     String _validateNome(String value) {
     
    if(value.isEmpty )
        return 'Digete o nome';
      return null;                 
  }
    String _validateGenero(String value) {
     
    if(value.isEmpty )
        return 'Digete o genero';
      return null;                 
  }
   String _validateBilhete(String value) {
     
    if(value.isEmpty )
        return 'Digete o número do BI';
      return null;                 
  }
   String _validateTelefone(String value) {
     
    if(value.isEmpty)
        return 'o número de telefone pelo menus de conter 9';
      return null;                 
  }

 String _validateEmail(String value) {
     
    if(value.isEmpty || !value.contains("@") )
        return 'E-mail Inválido';
      return null;                 
  }




  String _validatePassword(String value) {
    if(value.length < 9){
      return 'A senha precisa ter pelo menus 9 caracter';
    }
      return null;                 
  }
  void _onClickLogin() async {

     if(! _formKey.currentState.validate()){
         return;
     }
  
     String nome=_nomeController.text;
     String genero=_generoController.text;
     String bilhete=_bilheteController.text;
     String telefone=_telefoneController.text;
     String email = _emailController.text;
     String password= _passController.text;

  

  }
    
}