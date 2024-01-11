// file_picker_provider.dart

// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerProvider with ChangeNotifier {
  List<Map<String, dynamic>> _pedidosList = [];
  String _jsonResult = '';

  List<Map<String, dynamic>> get pedidosList => _pedidosList;

  bool get hasData => _pedidosList.isNotEmpty;

  String get jsonResult => _jsonResult;

  // Método para limpar a seleção
  void limparSelecao() {
    // Limpe a lista de pedidos ou faça qualquer outra lógica necessária
    pedidosList.clear();

    // Notifique os ouvintes (widgets) que os dados foram alterados
    notifyListeners();
  }

  Future<void> pickAndReadTxt() async {
    try {
      FilePickerResult? picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      if (picked != null) {
        String content = String.fromCharCodes(picked.files.first.bytes!);
        List<String> lines = LineSplitter.split(content).toList();

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

        _pedidosList = [];

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

        RegExp produtoRegExp = RegExp(r'^(\d{6}[A-Za-z])');

        for (String line in lines) {
          if (line.toLowerCase().contains('sglinear:')) {
            RegExp ultimasLetrasRegExp = RegExp(r'(.{8})$');
            RegExpMatch? match = ultimasLetrasRegExp.firstMatch(line);
            if (match != null) {
              hora = match.group(1)!;
            }
          }

          if (line.toLowerCase().contains('filial: 1')) {
            RegExp dataentregaRegExp = RegExp(r'Entrega: (\S{8})');
            RegExpMatch? match = dataentregaRegExp.firstMatch(line);
            if (match != null) {
              dataentrega = match.group(1);
            }
          }

          if (line.toLowerCase().contains('cliente:')) {
            RegExp regExp = RegExp(r': (\d+) - (.+)$');
            RegExpMatch? match = regExp.firstMatch(line);
            if (match != null) {
              cdcliente = match.group(1);
              nomedocliente = match.group(2);
            }
          }

          if (line.contains(RegExp(r'(\d{6})/\d{2}/\d{2}/\d{4}'))) {
            RegExp dataRegExp = RegExp(r'(\d{6})');
            RegExpMatch? dataMatch = dataRegExp.firstMatch(line);

            String palavraChaveEncontrada = palavrasChave.firstWhere(
                (palavra) => line.contains(palavra),
                orElse: () => '');

            if (palavraChaveEncontrada.isNotEmpty) {
              corte = palavraChaveEncontrada;
            }

            if (dataMatch != null) {
              pedido = dataMatch.group(1);
            }
          }

          RegExp regExp = RegExp(r'(\d{6})/\d{2}/\d{2}/\d{4}');
          if (line.contains(regExp)) {
            int indice = line.indexOf(regExp);
            if (indice + 20 + 8 <= line.length) {
              horaentrega = line.substring(indice + 19, indice + 19 + 8);
            }
          }

          RegExpMatch? produtoMatch = produtoRegExp.firstMatch(line);
          if (produtoMatch != null) {
            var produtoCodigo = produtoMatch.group(1)!;
            codigoProduto = line.substring(0, 6);

            int posicaoInicioNome = 6;
            int posicaoFimNome = line.indexOf('     ', posicaoInicioNome);
            if (posicaoFimNome != -1) {
              nomeProduto =
                  line.substring(posicaoInicioNome, posicaoFimNome).trim();
            }

            RegExpMatch? numeroDecimalMatch =
                RegExp(r'\b\d+\,\d+\b').firstMatch(line);
            if (numeroDecimalMatch != null) {
              quantidade = numeroDecimalMatch.group(0)!;
            }

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

            _pedidosList.add(pedidoMap);
          }
        }

        _jsonResult = json.encode(_pedidosList);
        print(_jsonResult);
        DateTime data = DateTime.now();
        print(
            'Entrega para : $dataentrega, corte atualizado pelo PCP em : $data');
      } else {
        print('Seleção cancelada');
      }
    } catch (e) {
      print('Erro: $e');
    }

    notifyListeners();
  }
}
