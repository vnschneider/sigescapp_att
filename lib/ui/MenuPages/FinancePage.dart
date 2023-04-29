// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'NavigationDrawer.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  State<FinancePage> createState() => _FinancePage();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _FinancePage extends State<FinancePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final List<String> _names = [
    'João',
    'Felipe',
    'Olivera',
    'William',
    'Elisa',
    'Jaime',
    'Benjamin',
    'Lucas',
    'Mateus',
    'Erick',
    'Alexandre'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text('Financeiro'),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 68, 3, 129),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.monetization_on),
            ),
            Tab(
              icon: Icon(Icons.report),
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
            child: Text("Gerar boletos"),
          ),
          const Center(
            child: Text("Relatório financeiro"),
          ),
        ],
      ),
    );
  }

  void actionPopUpItemSelected(String value, String name) {
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
