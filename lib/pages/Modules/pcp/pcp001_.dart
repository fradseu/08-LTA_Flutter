//Componentes

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/layout/myDrawer.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/view/pcp001.dart';

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
            const AspectRatio(
              aspectRatio: 0.4,
              child: myDrawer_PCP(),
            ),
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
