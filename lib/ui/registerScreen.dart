import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterScreen> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  final _regKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Form(
        key: _regKey,
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
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return "กรุณาระบุข้อมูลให้ครบถ้วน";
                } else if(value == "admin"){
                  return "user นี้มีอยู่ในระบบแล้ว";
                }
              }
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Enter Your Password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return "กรุณาระบุข้อมูลให้ครบถ้วน";
                }
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Please Confirm Your Password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return "กรุณาระบุข้อมูลให้ครบถ้วน";
                }
              }
            ),
            RaisedButton(
              child: Text("Continue".toUpperCase()),
              onPressed: (){
                if(_regKey.currentState.validate() == true){
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