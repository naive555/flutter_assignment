import 'package:flutter/material.dart';

class MainTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Home'),
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: <Widget>[
              Center(child: new Text('Home')),
              Center(child: new Text('Notify')),
              Center(child: new Text('Map')),
              Center(child: new Text('Profile')),
              Center(child: new Text('Setup')),
            ],
          ),
          bottomNavigationBar: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              new Material(
                color: Theme
                  .of(context)
                  .primaryColor,
              child: new TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.view_quilt)),
                    Tab(icon: Icon(Icons.notifications)),
                    Tab(icon: Icon(Icons.explore)),
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.settings)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}