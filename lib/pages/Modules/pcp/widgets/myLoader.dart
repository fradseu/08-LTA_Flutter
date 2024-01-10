// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/constants/constants.dart';
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
                  height: MediaQuery.of(context).size.height / 1.75,
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

                          List<String> headersToHide = [
                            'fa_cod',
                            'fa_descricao',
                            'setores',
                            'horapreparacao',
                            'horaembalagem',
                            'tipodeentrega',
                            'nf_',
                            'entregador',
                            'mapa_entrega_1',
                            'mapa_entrega_2',
                            'status',
                            'quarentena',
                          ];

                          List<GridColumn> columns =
                              headers.map<GridColumn>((header) {
                            bool isVisible;
                            try {
                              // Verifica se o header está na lista de headersToHide
                              isVisible = !headersToHide.contains(header);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Erro ao processar headers: $e',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                              isVisible =
                                  false; // Define como false para ocultar a coluna
                            }

                            return GridColumn(
                              columnName: header,
                              visible: isVisible,
                              label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.centerLeft,
                                child: isVisible
                                    ? Text(
                                        headerLabels[header] ?? header,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    : const SizedBox(),
                              ),
                              autoFitPadding: const EdgeInsets.all(8.0),
                              width: isVisible
                                  ? (header == 'pedido'
                                      ? 85.0
                                      : header == 'dataentrega'
                                          ? 85.0
                                          : header == 'horaentrega'
                                              ? 85.0
                                              : header == 'cdcliente'
                                                  ? 85.0
                                                  : header == 'nomedocliente'
                                                      ? 300.0
                                                      : header ==
                                                              'codigoproduto'
                                                          ? 85.0
                                                          : header ==
                                                                  'nomeproduto'
                                                              ? 200.0
                                                              : MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  6)
                                  : 0.0,
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
          alignment: Alignment.topLeft,
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
