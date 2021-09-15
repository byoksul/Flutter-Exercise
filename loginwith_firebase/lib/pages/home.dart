import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginwith_firebase/pages/add_status.dart';
import 'package:loginwith_firebase/pages/status_list.dart';
import 'package:loginwith_firebase/service/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStatusPage()));
          },
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Hello World"),
                accountEmail: Text("helloworld@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/beyaz.png"),
                ),
              ),
              ListTile(
                title: Text('Anasayfa'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Profilim'),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.person),
              ),
              Divider(),
              ListTile(
                title: Text('Çıkış yap'),
                onTap: () {
                  _authService.signOut();
                  Navigator.pop(context);
                },
                leading: Icon(Icons.remove_circle),
              ),
            ],
          ),
        ),
        body: StatusListPage());
  }
}