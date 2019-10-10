import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_atlantico/screens/InicialScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyLA",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 125,
                            color: Theme.of(context).primaryColor,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "E-mail:",
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Por favor, insira seu e-mail";
                              return "";
                            },
                          ),
                          TextFormField(
                            keyboardAppearance: Brightness.dark,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Senha:",
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Por favor, insira sua senha";
                              return "";
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                            child: Container(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push( context, new CupertinoPageRoute(
                                      builder: (context) => TelaInicial())
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}