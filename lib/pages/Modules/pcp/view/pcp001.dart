//Componentes
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/layout/myCuts.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/layout/myFeeds.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/layout/myHeader.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/layout/myLoader.dart';

import '../../../../constants/constants.dart';

//Telas

//carregar pedidos
// pcp001.dart

class pcp001 extends StatelessWidget {
  var title = "Carregar pedido";

  pcp001({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header_PCP(title: title),
            SizedBox(height: defaultPadding),
            Row(
              //Body ou Main
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 70,
                  child: Column(
                    children: [
                      MyCuts_PCP(),
                      Divider(),
                      SizedBox(
                        height: defaultPadding,
                      ),
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
