// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'NavigationDrawer.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPage();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _TeacherPage extends State<TeacherPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final List<String> _names = [
    'Geografia',
    'Matemática',
    'Física',
    'Português',
    'Produção textual',
    'Ciência de dados',
    'Introdução a computação',
    'Curso de bingo',
    'Inglês instrumental',
    'Desenho 3D',
    'Biologia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text('Área do professor'),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 68, 3, 129),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.class_),
            ),
            Tab(
              icon: Icon(Icons.list),
            ),
            Tab(
              icon: Icon(Icons.note_add),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Scaffold(
            key: _scaffoldkey,
            body: ListView.builder(
              itemBuilder: (_, i) {
                String name = _names[i];
                return ListTile(
                  title: Text(name),
                  trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Deletar'),
                        )
                      ];
                    },
                    onSelected: (String value) =>
                        actionPopUpItemSelected(value, name),
                  ),
                );
              },
              itemCount: _names.length,
            ),
          ),
          const Center(
            child: Text("Gerenciamento de faltas"),
          ),
          const Center(
            child: Text("Gerenciamento de notas"),
          ),
        ],
      ),
    );
  }

  void actionPopUpItemSelected(String value, String name) {
    // ignore: deprecated_member_use
    //_scaffoldkey.currentState?.hideCurrentSnackBar();
    String message;
    if (value == 'edit') {
      message = 'Você selecionou este item para editar: $name';
    } else if (value == 'delete') {
      message = 'Você selecionou este item para deletar: $name';
    } else {
      message = 'Nada selecionado!';
    }
    //final snackBar = SnackBar(content: Text(message));
    //_scaffoldkey.currentState?.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
