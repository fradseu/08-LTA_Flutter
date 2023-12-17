//Componentes
import 'package:flutter/material.dart';

//Telas
import '../../../constants/constants.dart';
import '../../layout/myProfileCard.dart';
import '../../layout/mySearcheField.dart';

class scrnHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(),
                Expanded(child: searcheField()),
                profileCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
