// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class MyCuts extends StatelessWidget {
  MyCuts({
    Key? key,
  }) : super(key: key);

  // Simulando dados JSON
  Map<String, List<Map<String, dynamic>>> simulatedData = {
    "Confeitaria": [
      {"ESSENCIAL PAES": 123},
      {"CORTE 14:00": 123},
      {"CORTE 15:00": 123},
      {"CORTE 16:00": 123},
      {"URGENCIA": 10},
    ],
    "Pão de Leite": [
      {"ESSENCIAL PAES": 123},
      {"CORTE 14:00": 123},
      {"CORTE 15:00": 123},
      {"CORTE 16:00": 123},
      {"URGENCIA": 10},
    ],
    "Pão de francês": [
      {"ESSENCIAL PAES": 123},
      {"CORTE 14:00": 123},
      {"CORTE 15:00": 123},
      {"CORTE 16:00": 123},
      {"URGENCIA": 10},
    ],
    "Capacidades": [
      {"Confeitaria": "10%"},
      {"Pão de Leite": "15%"},
      {"Pão de frances": "25%"},
      {"Forneamento": "80%"},
    ],
  };

  var ultimoCorte = "02/01/2024 20:36:39";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Último corte: $ultimoCorte ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica do botão aqui
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Verificar os cortes',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        GridView.builder(
          shrinkWrap: true,
          itemCount: simulatedData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Número de colunas desejado
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
          ),
          itemBuilder: (context, index) => CorteItem(
            categoria: simulatedData.keys.elementAt(index),
            cortes: simulatedData.values.elementAt(index),
          ),
        ),
      ],
    );
  }
}

class CorteItem extends StatelessWidget {
  final String categoria;
  final List<Map<String, dynamic>> cortes;

  const CorteItem({
    Key? key,
    required this.categoria,
    required this.cortes,
  }) : super(key: key);

  IconData getIconForCategoria(String categoria) {
    switch (categoria.toLowerCase()) {
      case "confeitaria":
        return Icons.cake;
      case "pão de francês":
        return Icons.bakery_dining;
      case "pão de leite":
        return Icons.cookie;
      case "capacidades":
        return Icons.query_stats;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(defaultPadding - 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:
                    Icon(getIconForCategoria(categoria), color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(
                categoria,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: 8),
          for (var corte in cortes)
            Row(
              children: [
                Text(
                  corte.keys.first,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 8),
                Text(
                  corte.values.first.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
