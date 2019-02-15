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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: <Widget>[
            Image.asset(
              "resources/healthy.jpg",
              height: 200,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "UserId",
                hintText: "Please Enter Your UserID",
                icon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return 'กรุณาระบุ User or Password';
                }else if(value == "admin"){
                  return "User ไม่ถูกต้อง";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Please Enter Your Password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return "กรุณาระบุ User or Password";
                }else if(value == "admin"){
                  return "Password ไม่ถูกต้อง";
                }
              },
            ),
            RaisedButton(
              child: Text("Login".toUpperCase()),
              onPressed: (){
                if(_formKey.currentState.validate() == true){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MainTabScreen()));
                }// else{
                //   Scaffold.of(context).showSnackBar(SnackBar(content: Text('กรุณาระบุuser or password')));
                // }
              },
            ),
            FlatButton(
              child: Text("Register New Account"),
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