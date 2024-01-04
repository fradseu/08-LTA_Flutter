//Componentes
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';

//Telas
import '../../../../../constants/constants.dart';
import '../../../layout/myCarousel.dart';
import '../../../layout/myCuts.dart';
import '../../../layout/myFeeds.dart';
import '../../../layout/myHeader.dart';

class scrnHome extends StatelessWidget {
  const scrnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            //Header
            Header(),
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      MyCarousel()
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),

                //Lateral direita
                MyFeeds(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
