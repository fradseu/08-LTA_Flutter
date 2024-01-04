// Exemplo de um provider fictício
import 'package:flutter/material.dart';

class MeuProvider with ChangeNotifier {
  // Adicione os dados ou estados globais que você precisa gerenciar
  // Exemplo:
  int contador = 0;

  void incrementarContador() {
    contador++;
    notifyListeners();
  }
}
