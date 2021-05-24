import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _focoPassword= FocusNode();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
        elevation: (0.0),
      ),
      body:_body(),
    
    );
  }
    _body() {
    return Container(
        color: Colors.white,
        height: 400,
        width: 400,
        child: Form(
          key:_formKey,
          child: ListView(
            padding: EdgeInsets.only(left: 16.0, top: 120, right: 20),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                
               hintText: "E-mail"
                
                ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail Inválido";
                    },
                 
              ),
              
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                   icon: Icon(Icons.vpn_key),
                 border: OutlineInputBorder(borderRadius:BorderRadius.circular(16.0) ),
                  hintText: "password",
               
                ),
                textInputAction: TextInputAction.next,
                cursorColor: Colors.cyan,
                obscureText: true,
                focusNode:_focoPassword,
                onFieldSubmitted: (String text){
                  FocusScope.of(context).requestFocus(_focoPassword);
                },
                 validator: ( text) {
                      if (text.isEmpty || text.length < 6)
                        return "A senha deve conter 6 caracter";
                    },
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Colors.cyan,
                    onPressed: () {
                    if (_formKey.currentState.validate()) {
        
                    }
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}