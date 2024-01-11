//Componentes

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/view/pcp001.dart';
import '../../layout/myDrawer.dart';

//Tela

class pcp001_ extends StatelessWidget {
  const pcp001_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          //Alinha o header na parte superior da tela.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const myDrawer(),
            Expanded(
              // Esta parte ocupará 5/6 da tela,
              flex: 6,
              child: pcp001(),
            ),
          ],
        ),
      ),
    );
  }
}
