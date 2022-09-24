// ignore_for_file: file_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text('Perfil do usuário'),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 68, 3, 129),
      ),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20
              //top: 24 + MediaQuery.of(context).padding.top,
              //bottom: 24,
              ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/teachericon.png"),
              ),
              SizedBox(height: 12),
              Text(
                'Professor Exemplar',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              //SizedBox(height: 8),
              Text(
                'email.professor1@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
