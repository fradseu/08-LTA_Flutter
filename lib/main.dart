// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lta_flutter_application_01/provider/provider001.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/pcp001_.dart';
import 'package:lta_flutter_application_01/pages/Modules/home/main_screen.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Adicione seus providers aqui, se necessário
        // Exemplo de um provider fictício:
        ChangeNotifierProvider(create: (context) => MeuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LTA ADMIN Painel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.ubuntuMonoTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        canvasColor: secondaryColor,
      ),
      // Configurar rotas
      routes: {
        '/': (context) => const MainScreen(),
        '/pcp001': (context) => pcp001_(),
        // Adicione mais rotas conforme necessário
      },
      initialRoute: '/', // Rota inicial
    );
  }
}
