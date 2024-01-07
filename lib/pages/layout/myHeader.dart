// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // ignore: prefer_const_constructors
        Spacer(flex: 2),
        //Expanded(child: searcheField()),
        //profileCard(),
      ],
    );
  }
}
