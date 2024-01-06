import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        // Verifica se a lista de pedidos não está vazia
                        if (filePickerProvider.pedidosList.isNotEmpty) {
                          // Obtém as chaves (headers) da primeira entrada no JSON
                          List<String> headers =
                              filePickerProvider.pedidosList[0].keys.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                                columns: headers
                                    .map(
                                      (header) => DataColumn(
                                        label: Text(header),
                                      ),
                                    )
                                    .toList(),
                                rows: filePickerProvider.pedidosList
                                    .map((pedido) => DataRow(
                                        cells: headers
                                            .map((header) => DataCell(Text(
                                                pedido[header].toString())))
                                            .toList()))
                                    .toList()),
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
}
