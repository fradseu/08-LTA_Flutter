// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lta_flutter_application_01/provider/provider001.dart';
import 'package:lta_flutter_application_01/pages/Modules/pcp/pcp001_.dart';
import 'package:lta_flutter_application_01/pages/Modules/home/home001_.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'provider/file_picker_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //inicialização do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        // Adicionar aqui os providers
        // Exemplo de um provider fictício:
        ChangeNotifierProvider(create: (context) => MeuProvider()),
        ChangeNotifierProvider(create: (context) => FilePickerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LTA ADMIN Painel',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.ubuntuMonoTextTheme(
              ThemeData.dark().textTheme.copyWith(
                    bodySmall: TextStyle(color: Colors.white),
                    bodyMedium: TextStyle(color: Colors.white),
                    bodyLarge: TextStyle(color: Colors.white),
                    displaySmall: TextStyle(color: Colors.white),
                    displayMedium: TextStyle(color: Colors.white),
                    displayLarge: TextStyle(color: Colors.white),
                  )),
          canvasColor: secondaryColor),
      // Configurar rotas
      initialRoute: '/', // Rota inicial
      routes: {
        '/': (context) => const MainScreen(),
        '/pcp001': (context) => const pcp001_(),
        // Adicione mais rotas conforme necessário
      },
    );
  }
}
