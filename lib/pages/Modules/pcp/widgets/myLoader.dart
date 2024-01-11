// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/constants/constants.dart';
import 'package:lta_flutter_application_01/extensions/size_extensions.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../provider/file_picker_provider.dart';

class MyLoader_PCP extends StatelessWidget {
  const MyLoader_PCP({
    Key? key,
  }) : super(key: key);

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
          Row(
            children: [
              Expanded(
                child: Container(
                  height: context.percentHeight(.06),
                  color: const Color.fromARGB(255, 132, 199, 138),
                  child: Center(
                    child: Text('Lista de pedidos',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 75,
                  color: Colors.grey,
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            await filePickerProvider.pickAndReadTxt();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Arquivo pedidos41.txt lido com sucesso!',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.grey[100], // Cor do texto
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  2.0), // Cantos com raio 2
                            ),
                          ),
                          child: const Text('Selecionar e Ler Pedidos'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 75,
                  color: Colors.grey,
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            // Limpar a seleção
                            filePickerProvider.limparSelecao();

                            // Adicional: Exibir um SnackBar informando que a seleção foi limpa
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Seleção limpa com sucesso!',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.grey[100], // Cor do texto
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  2.0), // Cantos com raio 2
                            ),
                          ),
                          child: const Text('Limpar seleção'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 75,
                  color: Colors.grey,
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            // Limpar a seleção

                            // Adicional: Exibir um SnackBar informando que a seleção foi limpa
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Pedidos enviados ao servidor com sucesso!',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.grey[100], // Cor do texto
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  2.0), // Cantos com raio 2
                            ),
                          ),
                          child: const Text('Enviar pedidos para o servidor'),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: context.percentHeight(.57),
                  color: secondaryColor,
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        if (filePickerProvider.pedidosList.isNotEmpty) {
                          List<String> headers =
                              filePickerProvider.pedidosList[0].keys
                                  .map<String>(
                                    (header) => header.toLowerCase().trim(),
                                  )
                                  .toList();

                          Map<String, String> headerLabels = {
                            'pedido': 'Número do Pedido',
                            'dataentrega': 'Data de Entrega',
                            'horaentrega': 'Hora de Entrega',
                            'corte': 'Tipo de Corte',
                            'cdcliente': 'Cód. Cliente',
                            'nomedocliente': 'Nome do Cliente',
                            'codigoproduto': 'Código do Produto',
                            'nomeproduto': 'Nome do Produto',
                            'quantidade': 'Quantidade',
                          };

                          List<GridColumn> columns =
                              headers.map<GridColumn>((header) {
                            return GridColumn(
                              columnName: header,
                              label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  headerLabels[header] ?? header,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              autoFitPadding: const EdgeInsets.all(8.0),
                              width: header == 'nomedocliente'
                                  ? 300.0
                                  : header == 'nomeproduto'
                                      ? 200.0
                                      : context.percentHeight(.16),
                            );
                          }).toList();

                          return SfDataGrid(
                            columnWidthMode: ColumnWidthMode.auto,
                            source: _getDataSource(
                              filePickerProvider.pedidosList,
                              context,
                            ),
                            columns: columns,
                          );
                        } else {
                          return const Text('Nenhum dado disponível.');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  EmployeeDataSource _getDataSource(
    List<Map<String, dynamic>> data,
    BuildContext context,
  ) {
    List<DataGridRow> rows = data.map<DataGridRow>((rowData) {
      return DataGridRow(
        cells: rowData.entries.map<DataGridCell>((entry) {
          return DataGridCell<dynamic>(
            columnName: entry.key,
            value: entry.value,
          );
        }).toList(),
      );
    }).toList();

    return EmployeeDataSource(rows: rows, context: context);
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required this.rows, required this.context});

  @override
  final List<DataGridRow> rows;
  final BuildContext context;

  List<DataGridRow> get dataGridRows => rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            dataGridCell.value.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      }).toList(),
    );
  }
}
