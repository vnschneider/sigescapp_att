// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login/LoginPage.dart';
import 'FinancePage.dart';
import 'ManagerPage.dart';
import 'TeacherPage.dart';
import 'UserPage.dart';
import '../MenuPages/NavigationDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text('Página inicial'),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 68, 3, 129),
      ),
      drawer: CustomNavigationDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              ),
              onPressed: () {},
              child: const Text('Bem vindo de volta Professor!'),
            ),
          ],
        ),
      ),
    );
  }
}