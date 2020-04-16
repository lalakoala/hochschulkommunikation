import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/authentification.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _obscureText = true;

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hochschulkommunikation"),
        backgroundColor: Color.fromARGB(220, 102, 204, 51),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 150, 204, 121),
          //102 204 51 hochschulgrün zu intensiv
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    image: AssetImage('lib/assets/Hochschullogo.jpg'),
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                  child: TextFormField(
                    onSaved: (value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "E-Mail            (die E-Mail ist \"email\")",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                    ),
                    validator: (val) {
                      if (val.length == 0) {return "Bitte E-Mail angeben";}
                      else return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 10),
                  child: TextFormField(
                    onSaved: (value) => _password = value,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: "Passwort       (das Passwort ist \"1\")",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {return "Bitte Passwort eingeben";}
                      else return null;
                    },
                  ),
                ),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    final form = _formKey.currentState;
                    form.save();
                    if (form.validate()) {
                    //  print("test $_email $_password");
                      Provider.of<AuthService>(context).loginUser(_email, _password);
                    }
                  }
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
