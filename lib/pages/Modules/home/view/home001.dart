//Componentes
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';

//Telas
import '../../../../../constants/constants.dart';
import '../../../layout/myCarousel.dart';
import '../../../layout/myCuts.dart';

class home001 extends StatelessWidget {
  const home001({super.key});

  @override
  Widget build(BuildContext context) {
    var title = "Página Inicial";
    var ultimoCorte = "02/01/2024 20:36:39";
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            //Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Spacer(flex: 1),
                Flexible(
                  child: Text('Última carga: $ultimoCorte',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            //body
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 70,
                  child: Column(
                    children: [
                      MyCuts(),
                      Divider(),
                      SizedBox(height: defaultPadding),
                      MyCarousel()
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
                //Lateral direita
                //MyFeeds(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
