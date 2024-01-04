// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class MyLoader_PCP extends StatelessWidget {
  const MyLoader_PCP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0), // Adiciona padding de 8
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0), // Adiciona borda branca
                  ),
                  child: Container(
                    height: 75,
                    color: Color.fromARGB(255, 132, 199, 138),
                    child: Center(
                      child: Text(
                          'Carregar ARQUIVO TXT File Picker e botão validar envio'),
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
                  padding: EdgeInsets.all(8.0), // Adiciona padding de 8
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0), // Adiciona borda branca
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: secondaryColor,
                    child: Center(
                      child: Text('Alguma lista para pré visualizar o json'),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
