//import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold( 
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset('images/logo.png', 
                  height: 300.0,
                  ),
                ),
                const SizedBox(height: 15.0,),
                _titleHeader(),
                const SizedBox(height: 15.0,),
                _userTextField(),
                const SizedBox(height: 15.0,),
                _passwordTextField(),
                const SizedBox(height: 20.0,),
                _bottonLogin(),
              ],
            ),
          ),
        ),
    );
  }
  
  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo Electronico',
            ),
            onChanged: (value){

            },
          )
        );
      }
    );
  }
  
  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.password),
              hintText: 'Contrasena',
              labelText: 'Contraseña',
            ),
             onChanged: (value){

            },
          )
        );
      }
    );
  }
  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 218, 109, 21),
            elevation: 15.0,
          ),
          onPressed: (){} ,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Iniciar Sesión',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        );
      }
    );
  }

  Widget _titleHeader(){
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return const Text.rich(
          TextSpan(
            text: 'Inspirar',
            children: <TextSpan>[
              TextSpan(text: ' Psicologia', style: TextStyle(fontStyle: FontStyle.italic)),
            ]
          ),
        );
      }
    );
  }
}
