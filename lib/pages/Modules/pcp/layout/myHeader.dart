// Header_PCP.dart

// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/layout/myProfileCard.dart';
import 'package:lta_flutter_application_01/pages/layout/mySearcheField.dart';

class Header_PCP extends StatelessWidget {
  final String title;

  const Header_PCP({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ultimoCorte = "02/01/2024 20:36:39";
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(flex: 2),
        Text(
          'Último corte: $ultimoCorte ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        //const Expanded(child: searcheField()),
        //const profileCard(),
      ],
    );
  }
}
