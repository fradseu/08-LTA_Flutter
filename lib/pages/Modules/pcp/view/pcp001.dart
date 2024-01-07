//Componentes
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/widgets/myLoader.dart';

import '../../../../constants/constants.dart';
import '../../../layout/myCuts.dart';

class pcp001 extends StatelessWidget {
  var title = "Carregar pedido";
  var ultimoCorte = "02/01/2024 20:36:39";

  pcp001({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Spacer(flex: 2),
                Text('Última carga: $ultimoCorte',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            SizedBox(height: defaultPadding),
            Row(
              //Body ou Main
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 70,
                  child: Column(
                    children: [
                      MyCuts(),
                      Divider(),
                      SizedBox(height: defaultPadding),
                      MyLoader_PCP()
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
