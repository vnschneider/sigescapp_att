import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import '../login/RegisterPage.dart';
import 'HomePage.dart';

List listaAlunos = [
  'Eduarda',
  'Noah',
  'Ana Cecília',
  'Gabrielly',
  'Chloe',
  'Ana Lívia',
  'Benjamin',
  'Pérola',
  'Samuel',
  'Benício',
  'Maria Flor',
  'Maria Heloísa',
  'Matheus',
  'Larissa',
  'Miguel',
  'Ana Sophia',
  'Maria Elisa',
  'Ana Vitória',
  'Arthur',
  'Bernardo',
  'Pedro',
  'Melinda',
  'Gabriel',
  'Davi',
  'Gael',
  'Pietra',
  'Théo',
  'Ravi',
  'Heitor',
  'Maria Eloá',
];

String compara(String retorno) {
  if (retorno == "2008") {
    return 'Maternal';
  }
  if (retorno == "2009") {
    return 'Jardim I';
  }
  if (retorno == "2010") {
    return 'Jardim II';
  }
  if (retorno == "2011") {
    return '1º Ano EF';
  }
  if (retorno == "2012") {
    return '2º Ano EF';
  }
  if (retorno == "2013") {
    return '3º Ano EF';
  }
  if (retorno == "2014") {
    return '4º Ano EF';
  }
  if (retorno == "2015") {
    return '5º Ano EF';
  }
  if (retorno == "2016") {
    return '6º Ano EF';
  }
  if (retorno == "2017") {
    return '7º Ano EF';
  }
  if (retorno == "2018") {
    return '8º Ano EF';
  }
  if (retorno == "2019") {
    return '9º Ano EF';
  }
  if (retorno == "2020") {
    return '1º Ano EM';
  }
  if (retorno == "2021") {
    return '2º Ano EM';
  }
  if (retorno == "2022") {
    return '3º Ano EM';
  }

  return "Impossível";
}

class ManagerPage extends StatelessWidget {
  const ManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ));
          },
          backgroundColor: const Color.fromARGB(255, 68, 3, 129),
          foregroundColor: const Color.fromARGB(255, 255, 253, 237),
          child: const Icon(Icons.add),
        ),
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text('Gestão de matrículas'),
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 68, 3, 129),
        ),
        body: DataTable2(
          showCheckboxColumn: true,
          dataRowHeight: 50,
          showBottomBorder: true,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: const [
            DataColumn2(
              label: Text('ID de aluno'),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Nome'),
            ),
            DataColumn(
              label: Text('Turma'),
            ),
            DataColumn(
              label: Text('E-mail'),
            ),
            DataColumn(
              label: Text('Ano de ingresso'),
            ),
            DataColumn(
              label: Text('Telefone do responsável'),
            ),
            DataColumn(
              label: Text('CPF'),
            ),
            DataColumn(
              label: Text('Status de pagamento'),
            )
          ],
          rows: List<DataRow>.generate(
            23,
            (index) => DataRow(
              cells: [
                DataCell(Text('${10000 + index}')),
                DataCell(Text('${listaAlunos[index]}')),
                DataCell(Text(
                    compara(((Random(index).nextInt(14) + 2008).toString())))),
                DataCell(Text(
                    '${((listaAlunos[index].toLowerCase()).replaceAll(' ', ''))}_${10000 + index}@sigesc.educa.ma')),
                DataCell(Text('${(Random(index).nextInt(14) + 2008)}')),
                DataCell(Text(
                    '(99) ${Random().nextInt(9999) + 90000} - ${Random().nextInt(9000) + 999}')),
                DataCell(Text(
                    '${Random().nextInt(899) + 100}.${Random().nextInt(899) + 100}.${Random().nextInt(899) + 100}-${Random().nextInt(89) + 10}')),
                const DataCell(Text('Em dia')),
              ],
            ),
          ),
        ),
      );
}
