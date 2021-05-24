import 'package:flutter/material.dart'; 


class AppButton extends StatelessWidget {

  AppButton(this.text, {this.onPressed});

  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return      ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 44,
                      child: RaisedButton(
                       child: Text("Entrar"),
                        textColor: Colors.white,
                        color: Colors.cyan,
                        onPressed: onPressed

                        
                      ),
                    ),
                  );
}
}