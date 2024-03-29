// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_pack/weather_pack.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';

class MyFeeds extends StatelessWidget {
  const MyFeeds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 29,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        height: 900,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Alinha à esquerda
            children: [
              SizedBox(
                child: Text(
                  'Clima tempo',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FutureBuilder<WeatherCurrent>(
                future: _fetchWeather(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Erro ao obter dados meteorológicos');
                  } else if (snapshot.hasData) {
                    WeatherCurrent weatherData = snapshot.data!;

                    String descricaoClima =
                        weatherData.weatherDescription as String;
                    String iconeClima = weatherData.weatherIcon as String;

                    String urlIcone =
                        'https://openweathermap.org/img/wn/$iconeClima@2x.png';

                    double? temperatura = (weatherData.temp)! / 10;
                    double tempArred =
                        double.parse(temperatura.toStringAsFixed(2));

                    return Card(
                      elevation: 5, // Ajuste conforme necessário
                      margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16), // Ajuste conforme necessário
                      child: ListTile(
                        leading: Image.network(
                          urlIcone,
                          scale: 2,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Clima: $descricaoClima\n'
                              'Temp: $tempArred°C',
                              style: const TextStyle(fontSize: h5Text),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Text('Nenhum dado disponível');
                },
              ),
              const Divider(color: dividerColor),
              SizedBox(
                child: Text(
                  'Mobilidade',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Erro ao obter dados de mobilidade');
                  } else if (snapshot.hasData) {
                    List<Map<String, dynamic>> linhas = snapshot.data!;

                    return Column(
                      children: linhas.map((linha) {
                        String nomeLinha = linha['nomeLinha'];
                        String statusLinha = linha['statusLinha'];

                        String leadingImage =
                            ''; // Caminho da imagem padrão, se não encontrar correspondência

                        // Mapeamento do nome da linha para o caminho da imagem
                        var imagens = {
                          "Linha 1 - Azul":
                              "assets/images/mobilidade/metro.png",
                          "Linha 2 - Verde":
                              "assets/images/mobilidade/metro.png",
                          "Linha 3 - Azul":
                              "assets/images/mobilidade/metro.png",
                          "Linha 4 - Amarela":
                              "assets/images/mobilidade/viaquatro.png",
                          "Linha 5 - Lilás":
                              "assets/images/mobilidade/viamobilidade.png",
                          "Linha 6 - Laranja": "assets/images/mobilidade/Metro",
                          "Linha 7 - Rubi": "assets/images/mobilidade/cptm.png",
                          "Linha 8 - Diamante":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 9 - Esmeralda":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 10 - Turquesa":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 11 - Coral":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 12 - Safira":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 13 - Jade":
                              "assets/images/mobilidade/cptm.png",
                          "Linha 15 - Prata":
                              "assets/images/mobilidade/metro.png",
                        };

                        // Verificar se há correspondência no mapa de imagens
                        if (imagens.containsKey(nomeLinha)) {
                          leadingImage = imagens[nomeLinha]!;
                        }

                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                              leading: Image.asset(
                                leadingImage,
                                scale: 2,
                              ),
                              title: Text(nomeLinha),
                              subtitle: Text(
                                statusLinha,
                                style: TextStyle(
                                  color: statusLinha != "Operação Normal"
                                      ? Colors.amber
                                      : null,
                                ),
                              )
                              // Adicione aqui qualquer outra informação que você deseja exibir no Card
                              ),
                        );
                      }).toList(),
                    );
                  }
                  return const Text('Nenhum dado disponível');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Função para obter dados meteorológicos usando a API do OpenWeatherMap
Future<WeatherCurrent> _fetchWeather() async {
  const String apiKey =
      '309e8cbafc4d064fb96d64c70507d5ab'; // Sua chave de API OpenWeatherMap
  const lang = WeatherLanguage.portugueseBrazilian;
  final wService = WeatherService(apiKey, language: lang);
  return await wService.currentWeatherByLocation(
      latitude: -23.5489, longitude: -46.6388);
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await http.get(
    Uri.parse(
        'https://script.google.com/macros/s/AKfycbzjJKm8SQWEGz9dPkGgLTeUHrcNg8-gI7j8tJns3DOehXAjzfhp0Uh2oaHls4IyeXyk/exec?functionName=getMobilidadeSp'),
  );

  if (response.statusCode == 200) {
    // Se a solicitação foi bem-sucedida, analise o JSON
    final Map<String, dynamic> data = json.decode(response.body);
    final List<Map<String, dynamic>> linhas =
        List<Map<String, dynamic>>.from(data['linhas']);
    return linhas;
  } else {
    // Se a solicitação não foi bem-sucedida, lance uma exceção.
    throw Exception('Falha ao carregar dados da API');
  }
}
