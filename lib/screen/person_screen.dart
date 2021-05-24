
import 'package:flutter/material.dart';
import 'package:rentcar/screen/sign_screen.dart';
import 'package:rentcar/utilizador/user.dart';
import 'package:rentcar/utilizador/user_manager.dart';
import 'package:rentcar/widgets/appButton.dart';
import 'package:rentcar/widgets/appTextForm.dart';
import 'bottom_nav_screen.dart';
import 'home_screen.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();

  final _senhaControler = TextEditingController();

  final _focusPassword =FocusNode();

 @override
 void initState() { 
   super.initState();
   
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
       appBar: AppBar(
         backgroundColor: Colors.cyan,
          title: Text("Entrar", style:TextStyle(color:Colors.white) ,),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
                child: Text(
                  "CRIAR CONTA",
                  style: TextStyle(fontSize: 15.0),
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                })
          ],
         elevation: 0,
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

                AppText(
                   'Nome', 
                   'Digite seu Nome', 
                    controller:_nomeController, 
                    validator: _validateNome, 
                    keyboardType: TextInputType.text, 
                    textInputAction: TextInputAction.next,
                    nextFocus: _focusPassword
                    ), 

                const SizedBox( height: 16),

               AppText(
                  'Password', 
                  'Digite sua password',
                  controller: _senhaControler, 
                  password: true, 
                  validator: _validatePassword, 
                  keyboardType: TextInputType.text, 
                  focusNode: _focusPassword, 
               
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
        return 'Degete o nome';
      return null;                 
  }

  String _validatePassword(String value) {
    if(value.length < 3){
      return 'A senha precisa ter pelo menus 3 caracter';
    }
      return null;                 
  }
  void _onClickLogin() async {

     if(! _formKey.currentState.validate()){
         return;
     }

     String login=_nomeController.text;
     String senha=_senhaControler.text;


     User usuario = await LoginUser.login(login,senha);

     if(usuario!= null){
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavBar()));
         print("$usuario");

     }else{
       print("Login errado");
       
     }


  }



}