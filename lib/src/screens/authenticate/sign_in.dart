import 'package:app_food_delivery/src/screens/authenticate/sign_up.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:app_food_delivery/src/shared/show_dialog.dart';
import 'package:app_food_delivery/src/widgets/big_button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationService _authenticationService = AuthenticationService();
  bool _toggleVisibility = true;
  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//text state
  String _password = "";
  String _email = "";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isLoading ? ShowLoadingIndicator() : SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Sign In",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 70.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text("Forgotten Password?",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold))
              ]),
              SizedBox(height: 20.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    _buildEmailTextFormFeild(),
                    SizedBox(height: 20.0),
                    _buildPasswordFeild(),
                  ]),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              _buildSignInButton(),
              Divider(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextFormFeild() {
    return TextFormField(
      onChanged: (input) {
        setState(() => _email = input);
      },
      controller: emailController,
      decoration: InputDecoration(
        hintText: "Email",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.0,
        ),
      ),
      onSaved: (input) => _email = input,
      validator: (input) => input.isEmpty
          ? 'Please enter email'
          : input.contains('@') == false
              ? 'please enter valid email'
              : null,
    );
  }

  Widget _buildPasswordFeild() {
    return TextFormField(
      onChanged: (input) {
        setState(() => _password = input);
      },
      controller: passwordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        hintText: "Password",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
            color: Colors.orangeAccent,
            onPressed: () {
              setState(() {
                _toggleVisibility = !_toggleVisibility;
              });
            },
            icon: _toggleVisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility)),
      ),
      obscureText: _toggleVisibility,
      onSaved: (input) {
        _password = input;
      },
      validator: (input) => input.isEmpty
          ? 'Please enter password'
          : input.length < 6
              ? 'password must be atleast six characters'
              : null,
    );
  }

  Widget _buildSignInButton() {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          setState(() {
            isLoading = true;
          });
          dynamic result = await _authenticationService.signIn(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
          if (result == null) {
            setState(() {
              isLoading = false;
              print('error signing in');
            });
          }
        }
      },
      child: BigButton(btnText: "Sign In"),
    );
  }
}
