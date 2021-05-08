import 'package:app_food_delivery/src/screens/authenticate/sign_in.dart';
import 'package:app_food_delivery/src/services/authentication_services.dart';
import 'package:app_food_delivery/src/widgets/big_button.dart';
import 'package:app_food_delivery/src/shared/show_dialog.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _toggleVisibility = true;
  bool isLoading = false;
  final AuthenticationService _authenticationService = AuthenticationService();

  // text state
  String email = "";
  String password = "";
  String error = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return isLoading ? ShowLoadingIndicator() : SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.grey.shade100,
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(height: 20.0),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(children: [
                      //   _buildUsernameTextFormFeild(),
                      //   SizedBox(height: 20.0),
                      _buildEmailTextFormFeild(),
                      SizedBox(height: 20.0),
                      _buildPasswordFeild(),
                      SizedBox(height: 20.0),
                      // _buildConfirmPasswordFeild(),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _buildSignUpButton(),
                Divider(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                            builder: (BuildContext context) => SignIn()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text(
                //       error,
                //       style: TextStyle(
                //           color: Colors.grey,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15.0),
                //     ),
              ]),
            ),
          ),
        ),
      
    );
  }

  Widget _buildEmailTextFormFeild() {
    return TextFormField(
      onChanged: (input) {
        setState(() => email = input);
      },
      controller: emailController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.0,
        ),
      ),
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
        setState(() => password = input);
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
      validator: (input) => input.isEmpty
          ? 'Please enter password'
          : input.length < 6
              ? 'password must be atleast six characters'
              : null,
    );
  }

  Widget _buildSignUpButton() {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          setState(() => isLoading= true);
          dynamic result = await _authenticationService.signUp(email: emailController.text.trim(), password: passwordController.text.trim());
          if (result == null) {
            setState(() {
              isLoading = false;
              error = "Please supply a valid email";
            });
          } 
          // else {
           
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HomeScreen(),
          //     ),
          //   );
          // }
        }
      },
      child: BigButton(btnText: "Sign Up"),
    );
  }
}
