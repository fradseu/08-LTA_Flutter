import 'package:flutter/material.dart';
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
                  height: 75,
                  color: Color.fromARGB(255, 132, 199, 138),
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            await filePickerProvider.pickAndReadTxt();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Arquivo lido com sucesso!'),
                              ),
                            );
                          },
                          child: const Text('Selecionar e Ler Pedidos'),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.75,
                  color: Colors.grey,
                  child: Center(
                    child: Consumer<FilePickerProvider>(
                      builder: (context, filePickerProvider, child) {
                        if (filePickerProvider.pedidosList.isNotEmpty) {
                          List<String> headers =
                              filePickerProvider.pedidosList[0].keys.toList();

                          List<GridColumn> columns =
                              headers.map<GridColumn>((header) {
                            return GridColumn(
                              columnName: header,
                              label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text(
                                  header,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              autoFitPadding: EdgeInsets.all(8.0),
                            );
                          }).toList();

                          return SfDataGrid(
                            source:
                                _getDataSource(filePickerProvider.pedidosList),
                            columns: columns,
                          );
                        } else {
                          return Text('Nenhum dado disponível.');
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

  EmployeeDataSource _getDataSource(List<Map<String, dynamic>> data) {
    List<DataGridRow> rows = data.map<DataGridRow>((rowData) {
      return DataGridRow(
        cells: rowData.entries.map<DataGridCell>((entry) {
          return DataGridCell<dynamic>(
              columnName: entry.key, value: entry.value);
        }).toList(),
      );
    }).toList();

    return EmployeeDataSource(rows: rows);
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required this.rows});

  final List<DataGridRow> rows;

  @override
  List<DataGridRow> get dataGridRows => rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}
