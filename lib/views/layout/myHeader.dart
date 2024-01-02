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
          'Home',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(flex: 2),
        Expanded(child: searcheField()),
        profileCard(),
      ],
    );
  }
}
