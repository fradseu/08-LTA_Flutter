// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import '../../extensions/size_extensions.dart';

import '../../constants/constants.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({
    super.key,
  });

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: collapsed ? 90 : context.percentWidth(.20),
      height: double.infinity,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: collapsed ? Alignment.center : Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      collapsed = !collapsed;
                    });
                  },
                  icon: Icon(collapsed ? Icons.keyboard_double_arrow_right : Icons.keyboard_double_arrow_left),
                ),
          ),
              Visibility(
                visible: collapsed == false,
                child: DrawerHeader(
                  child: Image.asset(
                    'assets/images/lta_logo2.png',
                    scale: 0.1,
                  ),
                ),
              ),
              ListTile(
                selectedTileColor: drawerSelected01,
                leading: Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.home),
                  child: const Tooltip(
                    message: 'Início',
                    child: Icon(Icons.home),
                    ),
                ),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'Início',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ExpansionTile(
                textColor: drawerSelected01,
                iconColor: drawerSelected01,
                initiallyExpanded: false,
                leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.warehouse),
                  child: const Tooltip(
                    message: 'Estoque',
                    child: Icon(Icons.warehouse),
                  )),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'Estoque',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                children: [
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.edit_note),
                  child: const Tooltip(
                    message: 'Cadastro',
                    child: Icon(Icons.edit_note),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Cadastro',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Cadastro');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.share_location),
                  child: const Tooltip(
                    message: 'Localização',
                    child: Icon(Icons.share_location),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Localização',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Localização');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.sticky_note_2),
                  child: const Tooltip(
                    message: 'Movimentação',
                    child: Icon(Icons.sticky_note_2),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Movimentação',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Movimentação');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.auto_delete),
                  child: const Tooltip(
                    message: 'Validade',
                    child: Icon(Icons.auto_delete),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Validade',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
                leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.engineering),
                  child: const Tooltip(
                    message: 'PCP',
                    child: Icon(Icons.engineering),
                  )),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'PCP',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                children: [
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.merge_type),
                  child: const Tooltip(
                    message: 'Carregar pedido',
                    child: Icon(Icons.merge_type),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Carregar pedido',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/pcp001');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.report_problem_outlined),
                  child: const Tooltip(
                    message: 'Pedido em quarentena',
                    child: Icon(Icons.report_problem_outlined),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Pedido em quarentena',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Pedido em quarentena');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.receipt_long),
                  child: const Tooltip(
                    message: 'Corte',
                    child: Icon(Icons.receipt_long),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Corte',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Corte');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.view_timeline),
                  child: const Tooltip(
                    message: 'PMP',
                    child: Icon(Icons.view_timeline),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'PMP',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('PMP');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.bar_chart),
                  child: const Tooltip(
                    message: 'Indicadores',
                    child: Icon(Icons.bar_chart),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Indicadores',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Indicadores');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.print),
                  child: const Tooltip(
                    message: 'Relatórios',
                    child: Icon(Icons.print),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Relatórios',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
                leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.factory),
                  child: const Tooltip(
                    message: 'Produção',
                    child: Icon(Icons.factory),
                  )),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'Produção',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                children: [
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.format_list_numbered),
                  child: const Tooltip(
                    message: 'Ordem de produção',
                    child: Icon(Icons.format_list_numbered),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Ordem de produção',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Ordem de produção');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.bakery_dining),
                  child: const Tooltip(
                    message: 'Forneamento',
                    child: Icon(Icons.bakery_dining),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Forneamento',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Forneamento');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.fact_check),
                  child: const Tooltip(
                    message: 'Apontamento',
                    child: Icon(Icons.fact_check),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Apontamento',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Apontamento');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.menu_book),
                  child: const Tooltip(
                    message: 'Receitas',
                    child: Icon(Icons.menu_book),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Receitas',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
                leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.local_shipping),
                  child: const Tooltip(
                    message: 'Expedição',
                    child: Icon(Icons.local_shipping),
                  )),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'Expedição',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                children: [
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.call_split),
                  child: const Tooltip(
                    message: 'Separação',
                    child: Icon(Icons.call_split),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Separação',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Separação');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.ballot),
                  child: const Tooltip(
                    message: 'Pão francês',
                    child: Icon(Icons.ballot),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Pão francês',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Pão francês');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.ballot),
                  child: const Tooltip(
                    message: 'Mini pao francês',
                    child: Icon(Icons.ballot),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Mini pao francês',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
                leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.settings),
                  child: const Tooltip(
                    message: 'Configurações',
                    child: Icon(Icons.settings),
                  )),
                title: Visibility(
                  visible: collapsed == false,
                  child: Text(
                    'Configurações',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                children: [
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.manage_accounts),
                  child: const Tooltip(
                    message: 'Usuários',
                    child: Icon(Icons.manage_accounts),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Usuários',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Usuários');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.route),
                  child: const Tooltip(
                    message: 'Entregadores',
                    child: Icon(Icons.route),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Entregadores',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    onTap: () {
                      print('Entregadores');
                    },
                  ),
                  ListTile(
                    selectedTileColor: drawerSelected01,
                    horizontalTitleGap: 8.0,
                    leading:  Visibility(
                  visible: collapsed == true,
                  replacement: const Icon(Icons.devices),
                  child: const Tooltip(
                    message: 'Sistema',
                    child: Icon(Icons.devices),
                  )),
                    title: Visibility(
                      visible: collapsed == false,
                      child: Text(
                        'Sistema',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
      ),
    );
  }
}
