import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/LoginPage.dart';
import 'FinancePage.dart';
import 'HomePage.dart';
import 'ManagerPage.dart';
import 'TeacherPage.dart';
import 'UserPage.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      //final user = FirebaseAuth.instance.currentUser!;
      Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Material(
      color: const Color.fromARGB(255, 68, 3, 129),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const UserPage()),
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
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
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              //SizedBox(height: 8),
              Text(
                'email.professor1@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16, // Espaço vertical
        children: [
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Página inicial'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Financeiro'),
            onTap: () {
              //Fechar o navigation drawer após abrir a pagina
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FinancePage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Área do professor'),
            onTap: () {
              //Fechar o navigation drawer após abrir a pagina
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TeacherPage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Gestão de matrículas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ManagerPage(),
              ));
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 68, 3, 129),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Encerrar sessão'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginWidget(),
              ));
            },
          ),
        ],
      ),
    );
