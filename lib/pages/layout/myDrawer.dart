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
      width: (MediaQuery.of(context).size.width) / 6,
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
              title: Text(
                'Início',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.warehouse),
              title: Text(
                'Estoque',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.edit_note),
                  title: Text(
                    'Cadastro',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Cadastro');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.share_location),
                  title: Text(
                    'Localização',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Localização');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.sticky_note_2),
                  title: Text(
                    'Movimentação',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Movimentação');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.auto_delete),
                  title: Text(
                    'Validade',
                    style: Theme.of(context).textTheme.bodySmall,
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
              title: Text(
                'PCP',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.merge_type),
                  title: Text(
                    'Carregar pedido',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/pcp001');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.report_problem_outlined),
                  title: Text(
                    'Pedido em quarentena',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Pedido em quarentena');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.receipt_long),
                  title: Text(
                    'Corte',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Corte');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.view_timeline),
                  title: Text(
                    'PMP',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('PMP');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.bar_chart),
                  title: Text(
                    'Indicadores',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Indicadores');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.print),
                  title: Text(
                    'Relatórios',
                    style: Theme.of(context).textTheme.bodySmall,
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
              title: Text(
                'Produção',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.format_list_numbered),
                  title: Text(
                    'Ordem de produção',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Ordem de produção');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.bakery_dining),
                  title: Text(
                    'Forneamento',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Forneamento');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.fact_check),
                  title: Text(
                    'Apontamento',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Apontamento');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.menu_book),
                  title: Text(
                    'Receitas',
                    style: Theme.of(context).textTheme.bodySmall,
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
              title: Text(
                'Expedição',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.call_split),
                  title: Text(
                    'Separação',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Separação');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.ballot),
                  title: Text(
                    'Pão francês',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Pão francês');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.ballot),
                  title: Text(
                    'Mini pao francês',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Mini pao francês');
                  },
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              textColor: drawerSelected01,
              iconColor: drawerSelected01,
              initiallyExpanded: false,
              leading: const Icon(Icons.settings),
              title: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              children: [
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.manage_accounts),
                  title: Text(
                    'Usuários',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Usuários');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.route),
                  title: Text(
                    'Entregadores',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Entregadores');
                  },
                ),
                ListTile(
                  selectedTileColor: drawerSelected01,
                  horizontalTitleGap: 8.0,
                  leading: const Icon(Icons.devices),
                  title: Text(
                    'Sistema',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    print('Sistema');
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
