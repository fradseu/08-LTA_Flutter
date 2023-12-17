// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// Este desing foi adaptado para o aplicativo LTA, neste vamos utilizar
//restrições de tela para nao haver erros de overflow

  // Esse isMobile, isTablet, isDesktop nos ajudará mais tarde
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    //Se o seu width é maior do que 1100, então considere um desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    //Se o seu widht é menor do que 1100 e maior do que 850 então considere um tablet.
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    //Se menor do que 850 então um celular.
    else {
      return mobile;
    }
  }
}
