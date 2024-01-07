// ignore_for_file: must_be_immutable, file_names

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
      {"Pão de francês": "25%"},
      {"Forneamento": "80%"},
    ],
  };

  static const String ultimoCorte = "02/01/2024 20:36:39";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Wrap(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  color: const Color.fromARGB(255, 132, 199, 138),
                  child: Center(
                    child: Text('Lista de pedidos',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 30,
            children: simulatedData.entries
                .map(
                  (entry) => CorteItem(
                    categoria: entry.key,
                    cortes: entry.value,
                  ),
                )
                .toList(),
          )
        ],
      ),
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
    return Card(
      color: secondaryColor,
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.11,
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          title: Text(
            categoria,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cortes.map((corte) {
              final String chave = corte.keys.first;
              final dynamic valor = corte.values.first;
              return Text(
                "$chave: $valor",
                style: Theme.of(context).textTheme.bodySmall,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
