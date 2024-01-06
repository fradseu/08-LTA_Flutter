//Componentes

import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/Modules/home/view/home001.dart';
import 'package:lta_flutter_application_01/pages/layout/myDrawer.dart';

//Tela
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          //Alinha o header na parte superior da tela.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.4,
              child: myDrawer(),
            ),
            Expanded(
              // Esta parte ocupará 5/6 da tela,
              flex: 6,
              child: home001(),
            ),
          ],
        ),
      ),
    );
  }
}
