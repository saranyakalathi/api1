import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomeScreen extends StatefulWidget{
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
  
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<dynamic> users=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('REST Api'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user =users[index];
          final name =user['name']['first'];
          final email =user['email'];
          final color = user['gender']=='female'?Colors.greenAccent:Colors.redAccent;
          final value = user['gender']=='female'? 'F':'M';
          // final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            leading: CircleAvatar(
              child: Text(value),
              backgroundColor: color,
            ),
            title: Text(name),
            subtitle: Text(email),
          );
        },
      ),
      floatingActionButton:FloatingActionButton(onPressed: fetchUser,),
    );
  }
  void fetchUser() async{
  print('fetching user...');
  const url = 'https://randomuser.me/api/?results=50';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  setState(() {
    users = json['results'];
  });
  print('Fetching completed');
}
}

 