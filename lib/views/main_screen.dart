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
          children: [
            myDrawer(),
            Expanded(
              // Esta parte ocupará 5/6 da tela,
              flex: 5,
              child: scrnHome(),
            ),
          ],
        ),
      ),
    );
  }
}
