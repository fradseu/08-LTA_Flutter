//Componentes
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

//Tela
import '../../constants/constants.dart';

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white10)),
      child: Wrap(
        children: [
          Image.asset(
            'assets/images/adm2.png',
            height: 38,
            filterQuality: FilterQuality
                .none, // Evita antialiasing para manter a aparência pixelada
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text('Usuário'),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
