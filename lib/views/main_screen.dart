//Componentes

import 'package:flutter/material.dart';

//Tela
import 'Modules/home/home.dart';
import 'layout/myDrawer.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: scrnHome(),
            ),
          ],
        ),
      ),
    );
  }
}
