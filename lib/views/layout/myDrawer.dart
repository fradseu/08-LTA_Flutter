// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/images/lta_logo2.png',
                scale: 0.1,
              ),
            ),
            ListTile(
              selectedTileColor: drawerSelected01,
              horizontalTitleGap: 16.0,
              leading: const Icon(Icons.home),
              title: const Text(
                'Início',
                style: TextStyle(fontSize: drawerFontList01),
              ),
              onTap: () {
                print('Início');
              },
            ),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.warehouse),
              title: const Text(
                'Estoque',
                style: TextStyle(fontSize: drawerFontList01),
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.edit_note),
                  title: const Text(
                    'Cadastro',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Cadastro');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.share_location),
                  title: const Text(
                    'Localização',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Localização');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.sticky_note_2),
                  title: const Text(
                    'Movimentação',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Movimentação');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.auto_delete),
                  title: const Text(
                    'Validade',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Validade');
                  },
                ),
              ],
            ),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.engineering),
              title: const Text(
                'PCP',
                style: TextStyle(fontSize: drawerFontList01),
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.merge_type),
                  title: const Text(
                    'Carregar pedido',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Carregar pedido');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.receipt_long),
                  title: const Text(
                    'Corte',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Corte');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.view_timeline),
                  title: const Text(
                    'PMP',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('PMP');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.bar_chart),
                  title: const Text(
                    'Indicadores',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Indicadores');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.print),
                  title: const Text(
                    'Relatórios',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Relatórios');
                  },
                ),
              ],
            ),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.factory),
              title: const Text(
                'Produção',
                style: TextStyle(fontSize: drawerFontList01),
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.format_list_numbered),
                  title: const Text(
                    'Ordem de produção',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Ordem de produção');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.bakery_dining),
                  title: const Text(
                    'Forneamento',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Forneamento');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.fact_check),
                  title: const Text(
                    'Apontamento',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Apontamento');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.menu_book),
                  title: const Text(
                    'Receitas',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Receitas');
                  },
                ),
              ],
            ),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.local_shipping),
              title: const Text(
                'Expedição',
                style: TextStyle(fontSize: drawerFontList01),
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.call_split),
                  title: const Text(
                    'Separação',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Separação');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.ballot),
                  title: const Text(
                    'Pão francês',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Pão francês');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.ballot),
                  title: const Text(
                    'Mini pao francês',
                    style: TextStyle(fontSize: drawerFontList02),
                  ),
                  onTap: () {
                    print('Mini pao francês');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
