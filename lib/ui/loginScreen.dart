import 'package:flutter/material.dart';
import '../main_tab_screen.dart';
import 'registerScreen.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: <Widget>[
            Image.asset(
              "resources/healthy.jpg",
              height: 150,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "UserID",
                hintText: "Please Enter Your Email",
                icon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Please Enter Your Password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            RaisedButton(
              child: Text("Login".toUpperCase()),
              onPressed: (){
                if(emailController.text.isEmpty || passwordController.text.isEmpty){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("กรุณาระบุ User หรือ Password")));
                } else if(emailController.text == "admin" && passwordController.text == "admin") {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("User หรือ Password ไม่ถูกต้อง")));
                } else{
                   Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MainTabScreen()));
                }
              },
            ),
            FlatButton(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text("Register New Account", style: TextStyle(color: Colors.green)),
              ),
              // child: Text("Register New Account", style: TextStyle(color: Colors.green)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RegisterScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}