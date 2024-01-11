// Importações necessárias para o Flutter
// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, use_key_in_widget_constructors, avoid_print, file_names
/*
Código LTA para automação de PCP 

Este código tem como objetivo facilitar a distribuição de dados à fábrica,
fornecendo uma agilidade no processo produtivo.

*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

// Função principal que inicializa a aplicação Flutter

// Classe que representa a página inicial da aplicação
class MyFilePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pickAndReadTxt();
          },
          child: const Text('Selecionar e Ler Pedidos'),
        ),
      ),
    );
  }
}

// Função assíncrona que é chamada quando o botão é pressionado
Future<void> pickAndReadTxt() async {
  try {
    // Solicitar ao usuário que escolha um arquivo de texto
    FilePickerResult? picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    // Se o usuário escolheu um arquivo
    if (picked != null) {
      // Obter o conteúdo do arquivo como uma string
      String content = String.fromCharCodes(picked.files.first.bytes!);

      // Dividir as linhas do conteúdo do arquivo
      List<String> lines = LineSplitter.split(content).toList();

      // Variáveis para armazenar os dados do pedido
      var cdcliente;
      var nomedocliente;
      var pedido;
      var produtoCodigo;
      var codigoProduto;
      var nomeProduto;
      var quantidade;
      var corte;
      var dataentrega;
      var hora;
      var horaentrega;

      // Lista para armazenar os pedidos em formato de mapa
      List<Map<String, dynamic>> pedidosList = [];

      // Lista de palavras-chave para verificar em cada linha
      List<String> palavrasChave = [
        "14 DIAS",
        "15 DIAS",
        "28 DIAS",
        "30 DIAS",
        "CARTAO DE CREDITO",
        "DINHEIRO",
        "TICKET REFEICAO / ALIMENTACAO",
        "TRANSFERENCIA BANCARIA",
        "ESSENCIAL PAE",
        "CORTE 14:00",
        "CORTE 15:00",
        "CORTE 16:00",
        "URGENCIA",
      ];

      // Expressão regular para verificar se os seis primeiros caracteres
      //são números seguidos por uma letra
      RegExp produtoRegExp = RegExp(r'^(\d{6}[A-Za-z])');

      // Iterar sobre cada linha do arquivo
      for (String line in lines) {
        // Verificar se a linha contém 'sglinear' e extrair os 8 caracteres
        //hora
        if (line.toLowerCase().contains('sglinear:')) {
          // Expressão regular para extrair as últimas 8 letras da linha
          RegExp ultimasLetrasRegExp = RegExp(r'(.{8})$');

          // Encontrar a correspondência na linha
          RegExpMatch? match = ultimasLetrasRegExp.firstMatch(line);

          // Se houver correspondência, extrair as últimas 8 letras
          if (match != null) {
            hora = match.group(1)!;
          }
        }

        // Verificar se a linha contém 'Filial: 1' e extrair os 8 caracteres
        //após 'Entrega: '
        if (line.toLowerCase().contains('filial: 1')) {
          RegExp dataentregaRegExp = RegExp(r'Entrega: (\S{8})');
          RegExpMatch? match = dataentregaRegExp.firstMatch(line);
          if (match != null) {
            dataentrega = match.group(1);
          }
        }

        // Verificar se a linha contém 'Cliente:' e extrair o número e nome do
        // cliente
        if (line.toLowerCase().contains('cliente:')) {
          RegExp regExp = RegExp(r': (\d+) - (.+)$');
          RegExpMatch? match = regExp.firstMatch(line);
          if (match != null) {
            cdcliente = match.group(1);
            nomedocliente = match.group(2);
          }
        }

        // Verificar se a linha contém um padrão de pedido e extrair a data
        //do pedido
        if (line.contains(RegExp(r'(\d{6})/\d{2}/\d{2}/\d{4}'))) {
          RegExp dataRegExp = RegExp(r'(\d{6})');

          RegExpMatch? dataMatch = dataRegExp.firstMatch(line);

          // Verificar se a linha contém alguma palavra da lista 'palavrasChave'
          String palavraChaveEncontrada = palavrasChave.firstWhere(
              (palavra) => line.contains(palavra),
              orElse: () => '');

          // Se encontrou uma palavra-chave, armazenar na variável 'corte'
          if (palavraChaveEncontrada.isNotEmpty) {
            corte = palavraChaveEncontrada;
          }

          // Se encontrou uma correspondência para a data, extrair o valor
          if (dataMatch != null) {
            pedido = dataMatch.group(1);
          }
        }

        //expressao regular para obter o horário do pedido
        RegExp regExp = RegExp(r'(\d{6})/\d{2}/\d{2}/\d{4}');
        if (line.contains(regExp)) {
          int indice = line.indexOf(regExp);
          if (indice + 20 + 8 <= line.length) {
            horaentrega = line.substring(indice + 19, indice + 19 + 8);
          }
        }

        // Verificar se os seis primeiros caracteres são números seguidos por
        //uma letra (produto)
        RegExpMatch? produtoMatch = produtoRegExp.firstMatch(line);
        if (produtoMatch != null) {
          var produtoCodigo = produtoMatch.group(1)!;

          // Extrair e imprimir os seis primeiros caracteres da linha
          codigoProduto = line.substring(0, 6);

          // Extrair o nome do produto (após os seis primeiros caracteres)
          int posicaoInicioNome = 6;
          int posicaoFimNome = line.indexOf('     ', posicaoInicioNome);
          if (posicaoFimNome != -1) {
            nomeProduto =
                line.substring(posicaoInicioNome, posicaoFimNome).trim();
          }

          // Encontrar o primeiro número decimal na linha
          RegExpMatch? numeroDecimalMatch =
              RegExp(r'\b\d+\,\d+\b').firstMatch(line);
          if (numeroDecimalMatch != null) {
            quantidade = numeroDecimalMatch.group(0)!;
          }

          // Construir um mapa com os dados do pedido
          Map<String, dynamic> pedidoMap = {
            'Pedido': pedido,
            'DataEntrega': dataentrega,
            'HoraEntrega': horaentrega,
            'Corte': corte,
            'CdCliente': cdcliente,
            'NomeDoCliente': nomedocliente,
            'CodigoProduto': codigoProduto,
            'NomeProduto': nomeProduto,
            'Quantidade': quantidade,
          };

          // Adicionar o mapa à lista de pedidos
          pedidosList.add(pedidoMap);
        }
      }

      // Converter a lista de pedidos para JSON
      String jsonResult = json.encode(pedidosList);
      print(jsonResult);
      DateTime data = DateTime.now();
      print(
          'Entrega para : $dataentrega, corte atualizado pelo PCP em : $data');
    } else {
      print('Seleção cancelada');
    }
  } catch (e) {
    print('Erro: $e');
  }
}
