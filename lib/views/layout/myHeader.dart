import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/views/layout/myProfileCard.dart';
import 'package:lta_flutter_application_01/views/layout/mySearcheField.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Página Inicial',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36, // Tamanho da fonte (ajuste conforme necessário)
            fontWeight:
                FontWeight.w500, // Peso da fonte (ajuste conforme necessário)
          ),
        ),
        Spacer(flex: 2),
        Expanded(child: searcheField()),
        profileCard(),
      ],
    );
  }
}
