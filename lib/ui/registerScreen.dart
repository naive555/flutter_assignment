import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterScreen> {
  final emailController = new TextEditingController();
  final passwordController_1 = new TextEditingController();
  final passwordController_2 = new TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter Your Email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: passwordController_1,
              decoration: InputDecoration(
                labelText: "Enter Your Password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: passwordController_2,
              decoration: InputDecoration(
                labelText: "Please Confirm Your Password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            RaisedButton(
              child: Text("Continue".toUpperCase(), style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){
                if(emailController.text.isEmpty || passwordController_1.text.isEmpty || passwordController_2.text.isEmpty){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("กรุณาระบุข้อมูลให้ครบถ้วน")));
                } else if(emailController.text == "admin") {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("User นี้มีอยู่ในระบบแล้ว")));
                } else if(passwordController_1.text != passwordController_2.text) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Password ไม่ตรงกัน")));
                } else{
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}